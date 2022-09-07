require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic', 'ale', 'coc' },
                sections = { 'error', 'warn', 'info', 'hint' }
            },
            'diff'
        },
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'branch'},
    }
}
