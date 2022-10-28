local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if vim.fn.isdirectory(install_path) == 0 then
  packer_bootstrap = vim.fn.system { 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    print 'packer not loaded!'
    return
end

local packer_util = require 'packer.util'

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

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
    }

    use {
      'nvim-treesitter/nvim-treesitter-context',
      requires = 'nvim-treesitter/nvim-treesitter',
      config = function()
        require('treesitter-context').setup()
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup() end,
      event = 'BufEnter'
    }

    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require('bufferline').setup() end
    }

    -- complete engine
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'onsails/lspkind.nvim',
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lua',
        'dcampos/cmp-snippy',
      },
      config = function()
        require 'plugins.nvim-cmp'
      end
    }

    -- snippets
    use {
      'dcampos/nvim-snippy',
      'honza/vim-snippets',
    }

    use {
      'williamboman/mason.nvim',
      requires = 'neovim/nvim-lspconfig',
      config = function()
        require('mason').setup()
      end
    }

    use 'folke/lua-dev.nvim'

    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require('indent_blankline').setup() end
    }

    use {
      'akinsho/toggleterm.nvim',
      tag = 'v2.*',
      config = function()
        require 'plugins.toggleterm'
      end
    }

    use {
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn["mkdp#util#install"]()
      end
    }

    use {
      'kylechui/nvim-surround',
      run = function()
        require('nvim-surround').setup()
      end
    }

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

if not pcall(require, 'packer_compiled') then
  print("packer_compiled.lua doesn't exist, compiling packer_compiled.lua.")
  vim.cmd [[:PackerCompile]]
  print("Complation completed, please mannually restart NVIM.")
end
