local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup {}
nvim_lsp.vimls.setup {}
nvim_lsp.marksman.setup {}
nvim_lsp.html.setup {}
nvim_lsp.rust_analyzer.setup {}

nvim_lsp.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'P' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

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
