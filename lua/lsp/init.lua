local M = {}

local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local default_keymaps = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>',      { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true })
end

M.servers = {
  'sumneko_lua',
  'clangd',
  'pyright'
}

M.setup = function()
    for _, name in pairs(M.servers) do
        require('lsp.' .. name).setup(lspconfig, capabilities, default_keymaps)
    end
end

return M
