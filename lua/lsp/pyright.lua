M = {}

M.setup = function(lspconfig, capabilities, keymaps)
  lspconfig.pyright.setup({
    on_attach = keymaps,
    capabilities = capabilities,
    settings = {
      pyright = {
        disableLanguageServices = false,
        disableOrganizeImports = false,
      },
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  })
end

return M
