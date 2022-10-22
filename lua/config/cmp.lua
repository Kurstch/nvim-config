local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ "path" }, entry.source.name) then
                local icon, hl_group = require("nvim-web-devicons")
                    .get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group
                    return vim_item
                end
            end
            return lspkind.cmp_format({ with_text = false })(entry, vim_item)
        end
    },

    window = {
        completion = cmp.config.window.bordered(),
    },

    mapping = {
        ['<Down>']    = cmp.mapping.select_next_item(),
        ['<Up>']      = cmp.mapping.select_prev_item(),
        ['<Esc>']     = cmp.mapping.close(),
        ['<Tab>']     = cmp.mapping.confirm({
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
