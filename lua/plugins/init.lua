local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_packer)) > 0 then
    packer_bootstrap = vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

local packer = require 'packer'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile> | PackerCompile
  augroup end
]])

local init = {
    plugins = function(use)
        use 'wbthomason/packer.nvim'

        use {
            'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup()
                print('fuck world')
            end,
        }

        use {
            'folke/which-key.nvim',
            config = function()
                require('plugins.which-key')
            end
        }

        use {
            'folke/tokyonight.nvim',
            config = function()
                vim.g.tokyonight_style = 'night'
                vim.cmd [[colorscheme tokyonight]]
            end,
        }

        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require 'plugins.nvim-tree'
            end,
            tag = 'nightly',
            cmd = {
                'NvimTreeOpen',
                'NvimTreeClose',
                'NvimTreeToggle',
                'NvimTreeFocus',
                'NvimTreeRefresh',
                'NvimTreeFindFile',
                'NvimTreeFindFileToggle',
                'NvimTreeClipboard',
                'NvimTreeResize',
                'NvimTreeCollapse',
                'NvimTreeCollapseKeepBuffers',
            },
        }

        use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true, },
          config = function()
              require 'plugins.lualine'
          end,
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                require('nvim-treesitter.install').update {
                    with_sync = true,
                }
            end,
            config = function()
                require 'plugins.treesitter'
            end,
            event = 'BufEnter'
        }

        use {
            'lewis6991/gitsigns.nvim',
            config = function() require('gitsigns').setup() end,
            event = 'BufEnter'
        }

        use {
            'akinsho/bufferline.nvim',
            tag = "v2.*",
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require('bufferline').setup() end
        }
    end,
    config = {
        profile = {
            enable = true,
        },
        display = {
            open_fn = function()
                return require('packer.util').float { border = 'single' }
            end,
        },
    },
}

packer.startup { init.plugins, config = init.config }
