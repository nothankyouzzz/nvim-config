local which_key = require 'which-key'

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
}, {
    prefix = '<leader>'
})
