local elements = {
    'core',
    'plugins',
    'lsp'
}

for _, element in pairs(elements) do
    require(element):setup()
end
