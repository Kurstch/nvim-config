local Hydra = require('hydra')

-- Window management
Hydra({
    name = 'Windows',
    mode = 'n',
    body = '<C-w>',
    heads = {
        { 'v', '<C-w>v' },
        { 'n', '<C-w>n', { desc = 'create new window' } },
        { '-', '<C-w>-' },
        { '+', '<C-w>+' },
        { '=', '<C-w>=' },
        { '_', '<C-w>_' },
        { '|', '<C-w>|' },
        { '>', '<C-w>>' },
        { '<', '<C-w><', { desc = 'resize window' } },
        { 'h', '<C-w>h' },
        { 'j', '<C-w>j' },
        { 'k', '<C-w>k' },
        { 'l', '<C-w>l', { desc = 'go to window' } },
        { 'q', '<C-w>q', { desc = 'close window' } },
        { 'H', '<C-w>H' },
        { 'J', '<C-w>J' },
        { 'K', '<C-w>K' },
        { 'L', '<C-w>L', { desc = 'move window' } },
    }
})

