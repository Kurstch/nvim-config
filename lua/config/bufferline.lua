require('bufferline').setup({
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return icon .. count
        end,
        diagnostics_update_in_insert = true,
        show_buffer_close_icons = false,
        show_buffer_default_icon = false,
        show_tab_indicators = false,
    }
})
