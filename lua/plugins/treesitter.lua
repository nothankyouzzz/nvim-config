local status_ok, treesitter_config = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    print 'treesitter not loaded'
end

require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
