local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
if vim.fn.isdirectory(install_path) == 0 then
    print 'downloading packer.nvim'
    packer_bootstrap = vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    print 'packer not loaded!'
    return
end
local packer_util = require 'packer.util'

local init = {
    plugins = function(use)
        use 'wbthomason/packer.nvim'

        use {
            'windwp/nvim-autopairs',
            config = function()
                require('nvim-autopairs').setup()
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

        use {
            'hrsh7th/nvim-cmp',
            config = function()
                require 'plugins.nvim-cmp'
            end
        }

        use {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
        }

        use 'L3MON4D3/LuaSnip'

        use {
            'williamboman/nvim-lsp-installer',
            requires = { 'neovim/nvim-lspconfig', requires = 'cmp-nvim-lsp' },
            config = function()
                require 'plugins.nvim-lsp-installer'
            end
        }

        use "folke/lua-dev.nvim"

        if packer_bootstrap then
            packer.sync()
        end
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
        compile_path = packer_util.join_paths(vim.fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
    },
}

packer.startup { init.plugins, config = init.config }

local status_ok, _ = pcall(require, 'packer_compiled')
if not status_ok then
    print 'Error requiring packer_compiled.lua: run PackerSync to fix!'
end
