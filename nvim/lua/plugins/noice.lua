return {
    ---@type LazySpec
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "yamatsum/nvim-nonicons",
    },
    config = function()
        local noice = require("noice")
        local notify = require("notify")
        local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

        noice.setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,
            },
            routes = {
                { -- Show @recording messages
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
                { -- Silence all telescope notifications
                    filter = {
                        event = "notify",
                        find = "telescope",
                    },
                    opts = { skip = true },
                },
                { -- Avoid written messages
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
                { -- Avoid search messages
                    filter = {
                        event = "msg_show",
                        kind = "search_count",
                    },
                    opts = { skip = true },
                },
                { -- Avoid all messages with kind ""
                    filter = {
                        event = "msg_show",
                        kind = "",
                    },
                    opts = { skip = true },
                },
            },
        })
        notify.setup({
            icons = nonicons_extention.icons,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { focusable = false })
            end,
        })
    end,
}
