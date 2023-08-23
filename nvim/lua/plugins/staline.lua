return {
    -- Staline
    "tamton-aquib/staline.nvim",
    config = function()
        local staline  = require('staline')
        local stabline = require('stabline')

        local colors   = require("nord.colors")
        local icons    = require("config.icons")
        local nonicons = require("nvim-nonicons.mapping")

        staline.setup({
            sections = {
                left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
                mid = {},
                right = { 'file_name', 'line_column' }
            },
            mode_colors = {
                i = colors.nord3_gui_bright,
                n = colors.nord3_gui,
                c = colors.nord3_gui,
                v = colors.nord3_gui_bright
            },
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
            file_icons = {
                typescript = ' ',
                css = ' ',
                scss = ' ',
                javascript = ' ',
                javascriptreact = ' ',
                html = ' ',
                python = ' ',
                java = ' ',
                markdown = ' ',
                sh = ' ',
                zsh = ' ',
                vim = ' ',
                lua = ' ',
                haskell = ' ',
                conf = ' ',
                ruby = ' ',
                txt = ' ',
                rust = ' ',
                cpp = ' ',
                c = ' ',
                go = ' ',
            }
        })
        stabline.setup({
            style       = "bar", -- others: arrow, slant, bubble
            stab_left   = "┃",
            stab_right  = " ",

            fg          = colors.nord4_gui,
            -- bg       = Default is bg of "Normal".
            inactive_bg = colors.nord0_gui,
            inactive_fg = colors.nord2_gui,
            -- stab_bg  = Default is darker version of bg.,

            font_active = "bold",
            exclude_fts = { 'NvimTree', 'dashboard', 'lir', 'terminal' },
            stab_start  = "", -- The starting of stabline
            stab_end    = "",
            numbers     = nil,
        })
    end
}
