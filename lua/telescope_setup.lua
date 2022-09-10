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
    }
}

t.load_extension('harpoon')
