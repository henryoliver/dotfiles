return {
    -- Staline
    "tamton-aquib/staline.nvim",
    config = function()
        local staline = require("staline")
        -- local colors  = require("nord.colors")
        local icons   = require("config.icons")

        staline.setup({
            sections = {
                left = { "  ", "mode", " ", "branch", " ", "lsp" },
                mid = {},
                right = { "file_name", "line_column" }
            },
            -- mode_colors = {
            --     i = colors.nord3_gui_bright,
            --     n = colors.nord3_gui_bright,
            --     c = colors.nord3_gui_bright,
            --     v = colors.nord3_gui_bright
            -- },
            defaults = {
                true_colors = true,
                line_column = " [%l/%L] :%c  ",
                branch_symbol = " "
            },
            lsp_symbols = {
                Error = icons.log.error,
                Info = icons.log.info,
                Warn = icons.log.warning,
                Hint = icons.log.hint
            },
            file_icons = icons.file
        })
    end
}
