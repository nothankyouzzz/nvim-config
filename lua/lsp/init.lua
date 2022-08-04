local loaded, lspconfig = pcall(require, 'lspconfig')
if not loaded then
    print 'nvim-lspconfig not loaded'
    return
end

local lsp_servers = {
    'sumneko_lua',
}
for _, name in pairs(lsp_servers) do
    local exist, config = require('lsp.' .. name)
    if not exist then
        print('warning: lsp config for [' .. name .. '] not exist. skip configuration')
        goto skip
    end

    print(name)

    lspconfig[name].setup { config }

    ::skip::
end
