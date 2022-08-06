local M = {}

M.setup = function(lspconfig, capabilities)
    local config = require('lua-dev').setup {
        runtime_path = true,
        lspconfig = {
            on_attach = require('lsp').default_keymaps,
            capabilities = capabilities
        }
    }

    lspconfig['sumneko_lua'].setup(config)
end

return M
