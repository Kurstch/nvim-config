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
:set scrolloff=10

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

" UI / Workflow
Plug 'nvim-lualine/lualine.nvim'                    " Status bar
Plug 'ap/vim-css-color'                             " CSS Color Preview
Plug 'ryanoasis/vim-devicons'                       " Developer Icons
Plug 'lukas-reineke/indent-blankline.nvim'          " Indent Guide
Plug 'lewis6991/gitsigns.nvim'                      " Git tooling
Plug 'Pocco81/true-zen.nvim'                        " Zen focus
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }  " Colorscheme
Plug 'folke/which-key.nvim'                         " Key binding help
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }   " Buffer line
Plug 'kyazdani42/nvim-web-devicons'                 " Colored Icons for buffers
Plug 'TimUntersberger/neogit'                       " Git tooling
Plug 'yamatsum/nvim-cursorline'                     " Cursor Line
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}       " Terminal manager
Plug 'haringsrob/nvim_context_vt'                   " Shows context for functions, classes, etc.

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Helpers
Plug 'nvim-lua/plenary.nvim'                                            " Util functions
Plug 'dense-analysis/ale'                                               " Lint Engine
Plug 'preservim/nerdcommenter'                                          " Commenter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}             " Treesitter
Plug 'nvim-treesitter/nvim-treesitter-context'                          " Sticky Context
Plug 'ThePrimeagen/harpoon'                                             " Bookmarks
Plug 'windwp/nvim-autopairs'                                            " Auto closing for brackets and html tags
Plug 'anuvyklack/hydra.nvim'                                            " Improves keybindings
Plug 'phaazon/hop.nvim'                                                 " Faster key navigation
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown preview

" Language server configuration and utilities
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" Other
Plug 'andweeb/presence.nvim'    " Discord Presence
Plug 'famiu/nvim-reload'        " Allows reloading config without restarting session

call plug#end()

" Set <leader> key before running `setup` on packages
" because otherwise some features would use the wrong key
let mapleader = ' '

" Options for nvim-cmp
set completeopt=menu,menuone,noinsert,noselect

" Setup plugins
:lua require('config.cursorline')
:lua require('config.indent_blankline')
:lua require('config.telescope')
:lua require('config.hydra')
:lua require('config.lualine')
:lua require('config.cmp')
:lua require('config.lsp')
:lua require('gitsigns').setup()
:lua require('bufferline').setup()
:lua require('nvim-autopairs').setup()
:lua require('which-key').setup()
:lua require('neogit').setup()
:lua require('hop').setup()
:lua require('true-zen').setup{ integrations = { lualine = true }}
:lua require('mason').setup()
:lua require("mason-lspconfig").setup()
:lua require('lspsaga').init_lsp_saga()
:lua require('toggleterm').setup{}

filetype plugin on

" Setup colorscheme
:colorscheme tokyonight-night
:highlight Folded guibg=none

" Map keys
" Telescope
nnoremap <leader>fs <cmd>Telescope find_files hidden=true<CR>
nnoremap <leader>fc <cmd>Telescope commands<CR>
nnoremap <leader>ff <cmd>Telescope git_files<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fm <cmd>Telescope harpoon marks<CR>
nnoremap <leader>ft <cmd>Telescope treesitter<CR>
nnoremap <leader>fr <cmd>lua require('telescope').extensions.file_browser.file_browser({ sorting_strategy = "ascending", prompt_position = "top", hidden = true })<CR>
nnoremap <C-/> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<CR>
" Harpoon
nnoremap <leader>mm <cmd>lua require('harpoon.mark').add_file()<CR>
nnoremap <leader>mk <cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>
nnoremap <leader>mn <cmd>lua require('harpoon.ui').nav_next()<CR>
nnoremap <leader>mp <cmd>lua require('harpoon.ui').nav_prev()<CR>
" Hop
nnoremap <silent> <leader>hh :HopAnywhere<CR>
nnoremap <silent> <leader>hw :HopWord<CR>
nnoremap <silent> <leader>hl :HopLineStart<CR>
nnoremap <silent> <leader>hp :HopPattern<CR>
" True Zen
nnoremap <silent> <leader>za :TZAtaraxis<CR>
nnoremap <silent> <leader>zm :TZMinimalist<CR>
nnoremap <silent> <leader>zn :TZNarrow<CR>
nnoremap <silent> <leader>zf :TZFocus<CR>
" LSP
nnoremap <silent> <leader>ld :Lspsaga peek_definition<CR>
nnoremap <silent> <leader>lh :Lspsaga hover_doc<CR>
nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>ls <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lc :Lspsaga code_action<CR>
nnoremap <silent> <F2> :Lspsaga rename<CR>
" ToggleTerm
nnoremap <leader>ta :ToggleTermToggleAll<CR>
nnoremap <leader>tt <cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <esc> <C-\><C-n><CR>
