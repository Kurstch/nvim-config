":set number relativenumber
":set nu rnu
:set autoindent
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nowrap
:set termguicolors
:set ignorecase

" folding, thanks to this post:
" https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
:set foldenable
:set foldmethod=expr
:set foldexpr=nvim_treesitter#foldexpr()
:set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
:set fillchars=fold:\ 
:set foldminlines=1
:set foldlevel=10

call plug#begin()

Plug 'nvim-lualine/lualine.nvim'                            " Status bar
Plug 'https://github.com/ap/vim-css-color'                  " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons'            " Developer Icons
Plug 'catppuccin/nvim', {'as': 'catppuccin'}                " Color Theme
Plug 'nvim-lua/plenary.nvim'                                " Fuzzy Search
Plug 'nvim-telescope/telescope.nvim'                        " Fuzzy Search
Plug 'dense-analysis/ale'                                   " Lint Engine
Plug 'preservim/nerdcommenter'                              " Commenter
Plug 'lukas-reineke/indent-blankline.nvim'                  " Indent Guide
Plug 'lewis6991/gitsigns.nvim'                              " Git tooling
Plug 'TimUntersberger/neogit'                               " Git tooling
Plug 'andweeb/presence.nvim'                                " Discord Presence
Plug 'https://github.com/yamatsum/nvim-cursorline'          " Cursor Line
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-treesitter/nvim-treesitter-context'              " Sticky Context
Plug 'ThePrimeagen/harpoon'                                 " Bookmarks
Plug 'kyazdani42/nvim-web-devicons'                         " Colored Icons for buffers
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }           " Buffer line
Plug 'windwp/nvim-autopairs'                                " Auto closing for brackets and html tags
Plug 'folke/which-key.nvim'                                 " Key binding help
Plug 'https://github.com/anuvyklack/hydra.nvim'
Plug 'phaazon/hop.nvim'                                     " Faster key navigation
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown preview
Plug 'kyazdani42/nvim-tree.lua'

" Language server configuration and utilities
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

Plug 'Pocco81/true-zen.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

" Set <leader> key before running `setup` on packages
" because otherwise some features would use the wrong key
let mapleader = ' '

" Options for nvim-cmp
set completeopt=menu,menuone,noinsert,noselect

" Setup plugins
:lua require('cursorline')
:lua require('indent_blankline_setup')
:lua require('telescope_setup')
:lua require('hydra_setup')
:lua require('lualine_setup')
:lua require('cmp_setup')
:lua require('gitsigns').setup()
:lua require('bufferline').setup()
:lua require('nvim-autopairs').setup()
:lua require('which-key').setup()
:lua require('neogit').setup()
:lua require('hop').setup()
:lua require('lspconfig').tsserver.setup{}
:lua require('true-zen').setup{ integrations = { lualine = true }}
:lua require('nvim-tree').setup()
:lua require('mason').setup()
:lua require("mason-lspconfig").setup()

filetype plugin on

" Setup colorscheme
:colorscheme tokyonight-night
:highlight Folded guibg=none

" Map keys
nnoremap <leader>fs <cmd>Telescope find_files hidden=true<CR>
nnoremap <leader>fc <cmd>Telescope commands<CR>
nnoremap <leader>ff <cmd>Telescope git_files<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fm <cmd>Telescope harpoon marks<CR>
nnoremap <leader>ft <cmd>Telescope treesitter<CR>
nnoremap <leader>mm <cmd>lua require('harpoon.mark').add_file()<CR>
nnoremap <leader>mk <cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <leader>mn <cmd>lua require('harpoon.ui').nav_next()<CR>
nnoremap <leader>mp <cmd>lua require('harpoon.ui').nav_prev()<CR>
nnoremap <silent> <leader>hh :HopAnywhere<CR>
nnoremap <silent> <leader>hw :HopWord<CR>
nnoremap <silent> <leader>hl :HopLineStart<CR>
nnoremap <silent> <leader>hp :HopPattern<CR>
nnoremap <silent> <leader>za :TZAtaraxis<CR>
nnoremap <silent> <leader>zm :TZMinimalist<CR>
nnoremap <silent> <leader>zn :TZNarrow<CR>
nnoremap <silent> <leader>zf :TZFocus<CR>
nnoremap <silent> <leader>tt :NvimTreeToggle<CR>
nnoremap <silent> <leader>tf :NvimTreeFocus<CR>
nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lc <cmd>lua vim.lsp.buf.code_action()<CR>

