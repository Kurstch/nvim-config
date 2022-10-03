local t = require('telescope')

t.setup {
    defaults = {
        file_ignore_patterns = {
            'node_modules',
            'dist',
            'target',
            '.git',
            'coverage',
        }
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
        }
    }
}

t.load_extension('harpoon')
t.load_extension('file_browser')
t.load_extension('fzf')
t.load_extension('neoclip')
