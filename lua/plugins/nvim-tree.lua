local nvim_tree = require 'nvim-tree'

nvim_tree.setup {
    create_in_closed_folder = true,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    renderer = {
        group_empty = true,
        highlight_git = true,
        full_name = true,
        highlight_opened_files = 'all',
        indent_markers = {
            enable = true,
        },
    },
    filters = {
        dotfiles = true,
    },
}
