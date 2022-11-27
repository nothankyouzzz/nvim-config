M = {}

M.setup = function(lspconfig, capabilities, keymaps)
  lspconfig.clangd.setup({
    on_attach = keymaps,
    capabilities = capabilities,
  })
end

return M
