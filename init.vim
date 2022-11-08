set number
set relativenumber
set spell
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set nowrap
set termguicolors
set ignorecase
set scrolloff=20
set clipboard+=unnamedplus
set cc=80
set signcolumn=yes

" folding, thanks to this post:
" https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/
set foldenable
set foldmethod=syntax
set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
set fillchars=fold:\ 
set foldminlines=1
set foldlevel=10

call plug#begin()

" UI / Workflow
Plug 'nvim-lualine/lualine.nvim'                    " Status bar
Plug 'ap/vim-css-color'                             " CSS Color Preview
Plug 'ryanoasis/vim-devicons'                       " Developer Icons
Plug 'lukas-reineke/indent-blankline.nvim'          " Indent Guide
Plug 'lewis6991/gitsigns.nvim'                      " Git tooling
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }  " Colorscheme
Plug 'folke/which-key.nvim'                         " Key binding help
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }   " Buffer line
Plug 'kyazdani42/nvim-web-devicons'                 " Colored Icons for buffers
Plug 'TimUntersberger/neogit'                       " Git tooling
Plug 'yamatsum/nvim-cursorline'                     " Cursor Line
Plug 'onsails/lspkind.nvim'
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'

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
Plug 'windwp/nvim-autopairs'                                            " Auto closing for brackets and html tags
Plug 'anuvyklack/hydra.nvim'                                            " Improves keybindings
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " Markdown preview

" Language server configuration and utilities
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" Other
Plug 'andweeb/presence.nvim'    " Discord Presence
Plug 'famiu/nvim-reload'        " Allows reloading config without restarting session
Plug 'AckslD/nvim-neoclip.lua'  " Register
Plug 'ThePrimeagen/vim-be-good'

" Local development
Plug '~/plugins/mdlens'

call plug#end()

" Set <leader> key before running `setup` on packages
" because otherwise some features would use the wrong key
let mapleader = ' '

" Options for nvim-cmp
set completeopt=menu,menuone,noinsert,noselect

" Auto format rust files on write
autocmd BufWritePre * lua vim.lsp.buf.format(nil, 10)

" Auto recalculate folds when entering a buffer
" This is done because of a bug in telescope https://github.com/nvim-telescope/telescope.nvim/issues/699
autocmd BufEnter * normal zx

" Setup plugins
lua require('config.cursorline')
lua require('config.indent_blankline')
lua require('config.telescope')
lua require('config.hydra')
lua require('config.lualine')
lua require('config.cmp')
lua require('config.lsp')
lua require('config.neoclip')
lua require('config.bufferline')
lua require('gitsigns').setup()
lua require('nvim-autopairs').setup()
lua require('which-key').setup()
lua require('neogit').setup()
lua require('mason').setup()
lua require("mason-lspconfig").setup()
lua require('mdlens').setup({ workspaces = { '/home/martins/Documents/Notes' } })
lua require('twilight').setup({ inactive = true })
lua require('zen-mode').setup({ options = { cursorline = true } })

filetype plugin on

" Setup colorscheme
colorscheme tokyonight-night
highlight! default link Folded Comment
highlight ColorColumn guibg=#191a26

" Chnage default signcolumn icons
sign define DiagnosticSignError   text= texthl=DiagnosticSignError   linehl=               numhl=
sign define DiagnosticSignWarning text= texthl=DiagnosticSignWarning linehl=               numhl=
sign define DiagnosticSignInfo    text= texthl=DiagnosticSignInfo    linehl=               numhl=
sign define DiagnosticSignHint    text= texthl=DiagnosticSignHint    linehl=               numhl=
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" Map keys
" Unbind arrow keys to learn hjkl
nnoremap <Up> <Nop>
inoremap <Up> <Nop>
vnoremap <Up> <Nop>
nnoremap <Down> <Nop>
inoremap <Down> <Nop>
vnoremap <Down> <Nop>
nnoremap <Right> <Nop>
inoremap <Right> <Nop>
vnoremap <Right> <Nop>
nnoremap <Left> <Nop>
inoremap <Left> <Nop>
vnoremap <Left> <Nop>
" Telescope
nnoremap <leader>fs <cmd>Telescope find_files hidden=true<CR>
nnoremap <leader>fc <cmd>Telescope commands<CR>
nnoremap <leader>ff <cmd>Telescope git_files<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>ft <cmd>Telescope treesitter<CR>
nnoremap <leader>fr <cmd>lua require('telescope').extensions.file_browser.file_browser({ sorting_strategy = "ascending", prompt_position = "top", hidden = true })<CR>
nnoremap <leader>fp <cmd>Telescope neoclip a<CR>
nnoremap <C-/> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy())<CR>
" LSP
nnoremap <silent> <leader>ld <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lc <cmd>lua vim.lsp.bug.code_action()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
" Twilight & ZenMode
nnoremap <silent> <leader>tt :Twilight<CR>
nnoremap <silent> <leader>zt :ZenMode<CR>
