local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
    print 'which-key not loaded'
end

which_key.setup {
    window = {
        border = 'single',
    },
}

which_key.register({
    c = { '<cmd>edit $MYVIMRC<cr>', 'Edit init.lua', },
    e = { '<cmd>NvimTreeToggle<cr>', 'Toggle explore', },
    h = { '<cmd>nohlsearch<cr>', 'Disable highlight search', },
    q = { '<cmd>q!<cr>', 'Quit', },
    s = { '<cmd>cd %:h<cr>', 'Change workspace', },
    w = { '<cmd>w!<cr>', 'Write', },
    p = {
        name = 'Packer',
        c = { '<cmd>PackerCompile<cr>', 'Compile', },
        i = { '<cmd>PackerInstall<cr>', 'Install', },
        p = { '<cmd>PackerProfile<cr>', 'Profile', },
        s = { '<cmd>PackerStatus<cr>', 'Status', },
        u = { '<cmd>PackerUpdate<cr>', 'Update', },
    },
    b = {
        name = 'BufferLine',
        h = { '<cmd>BufferLineCloseLeft<cr>', 'Close left buffers', },
        l = { '<cmd>BufferLineCloseRight<cr>', 'Close right buffers', },
    }
}, {
    prefix = '<leader>'
})

which_key.register {
    ['<S-h>'] = { '<cmd>BufferLineCyclePrev<cr>', 'Cycle to prev', },
    ['<S-l>'] = { '<cmd>BufferLineCycleNext<cr>', 'Cycle to next', },
    ['<C-h>'] = { '<cmd>BufferLineMovePrev<cr>', 'Move to next', },
    ['<C-l>'] = { '<cmd>BufferLineMoveNext<cr>', 'Move to prev', },
}
