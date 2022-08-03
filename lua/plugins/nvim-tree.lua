local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    print 'nvim-tree not loaded'
    return
end

nvim_tree.setup {
    disable_netrw = true,
    create_in_closed_folder = true,
    sync_root_with_cwd = true,
    hijack_cursor = true,
    respect_buf_cwd = true,
    diagnostics = {
        enable = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    renderer = {
        group_empty = true,
        full_name = true,
        highlight_git = true,
        highlight_opened_files = 'all',
        indent_markers = {
            enable = true,
        },
        icons = {
            git_placement = 'signcolumn',
        },
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        change_dir = {
            global = true
        },
        open_file = {
            quit_on_open = true,
        },
    },
}
