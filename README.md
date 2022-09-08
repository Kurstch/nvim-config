# NeoVim Configuration

# Plugins

| repository                                                                       | purpose                                 |
| -------------------------------------------------------------------------------- | --------------------------------------- |
| [hop](https://github.com/phaazon/hop.nvim)                                       | easy and fast key navigation            |
| [conquer of completion](https://github.com/neoclide/coc.nvim)                    | auto completion                         |
| [planeary](https://github.com/nvim-lua/plenary.nvim)                             | util plugin                             |
| [telescope](https://github.com/nvim-telescope/telescope.nvim)                    | fuzzy finder                            |
| [ale](https://github.com/dense-analysis/ale)                                     | lint engine                             |
| [nerdcommenter](https://github.com/preservim/nerdcommenter)                      | comment functions                       |
| [Discord presence](https://github.com/andweeb/presence.nvim)                     |                                         |
| [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                 |                                         |
| [treesitter context](https://github.com/nvim-treesitter/nvim-treesitter-context) |                                         |
| [harpoon](https://github.com/ThePrimeagen/harpoon)                               |                                         |
| [autopairs](https://github.com/windwp/nvim-autopairs)                            |                                         |
| [hydra](https://github.com/anuvyklack/hydra.nvim)                                |                                         |
| [markdown preview](https://github.com/iamcco/markdown-preview.nvim)              | markdown preview                        |
| __git__                                                                          |                                         |
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim)                           |                                         |
| [neogit](https://github.com/TimUntersberger/neogit)                              |                                         |
| __ui__                                                                           |                                         |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                     | statusline                              |
| [bufferline](https://github.com/akinsho/bufferline.nvim)                         | bufferline                              |
| [which key](https://github.com/folke/which-key.nvim)                             | displays all possible key bindings      |
| [vim devicons](https://github.com/ryanoasis/vim-devicons)                        | icons                                   |
| [nvim web devicons](https://github.com/kyazdani42/nvim-web-devicons)             | more icons                              |
| [catppuccin](https://github.com/catppuccin/nvim)                                 | colot theme                             |
| [vim css coor](https://github.com/ap/vim-css-color)                              | css color preview                       |
| [cursorline](https://github.com/yamatsum/nvim-cursorline)                        | highlight words and lines on the cursor |
| [indent blankline](https://github.com/lukas-reineke/indent-blankline.nvim)       | shows indentation guides                |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                       | configurations for the nvim lsp client  |

# Custom Key Bindings

`<leader>` is mapped to `Space`

| keymap        | action                                                   |
| ------------- | -------------------------------------------------------- |
| __telescope__ |                                                          |
| \<leader>fs   | find files                                               |
| \<leader>ff   | find files while respecting .gitignore                   |
| \<leader>fc   | list all commands                                        |
| \<leader>fb   | list all open buffers                                    |
| \<leader>ft   | list values from treesitter (functions, variables, etc.) |
| \<leader>fm   | list all harpoon marks                                   |
| __harpoon__   |                                                          |
| \<leader>mm   | create harpoon mark                                      |
| \<leader>mk   | manage harpoon marks                                     |
| \<leader>mn   | go to next harpoon mark                                  |
| \<leader>mp   | go to previous harpoon mark                              |
| __hop__       |                                                          |
| \<leader>hh   | hop to anywhere                                          |
| \<leader>hw   | hop to beginning of word                                 |
| \<leader>hl   | hop to beginning of line                                 |
| \<leader>hp   | hop to pattern                                           |

