local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup{}
nvim_lsp.rust_analyzer.setup{}

require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        }
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                -- Enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
})

