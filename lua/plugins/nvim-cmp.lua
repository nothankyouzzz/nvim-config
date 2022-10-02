local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require 'cmp'
local snippy = require 'snippy'
local lspkind = require 'lspkind'

cmp.setup {
    snippet = {
        expand = function(args)
            require('snippy').expand_snippet(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
              cmp.select_prev_item()
          elseif snippy.can_jump(-1) then
              snippy.previous()
          else
              fallback()
          end
        end, { 'i', 's' }),
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm { select = true },
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua'},
        { name = 'snippy' },
        { name = 'buffer' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
    window = {
        completion = {
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
            col_offset = -3,
            side_padding = 0,
        },
    },
    view = {
        entries = {
            name = 'custom',
            selection_order = 'near_cursor',
        }
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            local kind = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })

            if entry.source.name == 'cmdline' then
                kind.kind = ''
                kind.menu = ''
            else
                local file_icon = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                if entry.source.name == 'path' and file_icon then
                    kind.kind = ' ' .. file_icon .. ' '
                else
                    kind.kind = ' ' .. strings[1] .. ' '
                end

                kind.menu = '['.. strings[2] .. ']'
            end

            return kind
        end,
    },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
