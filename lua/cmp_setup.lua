local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function()
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = {
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<Up>']   = cmp.mapping.select_prev_item(),
        ['<Esc>']  = cmp.mapping.close(),
        ['<Tab>']  = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<C-space>'] = cmp.mapping({
            i = function()
                if cmp.visible() then cmp.abort()
                else cmp.complete() end
            end,
            c = function()
                if cmp.visible() then cmp.close()
                else cmp.complete() end
            end
        })
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
})
