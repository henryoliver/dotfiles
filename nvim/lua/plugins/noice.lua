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
                { -- Silence
                    filter = {
                        any = {
                            { find = "telescope" },
                            { find = "file_browser" },
                            { event = { "msg_showmode", "msg_showcmd", "msg_ruler" } },
                            { event = "msg_show", kind = "" },
                            { event = "msg_show", kind = "search_count" },
                            { event = "msg_show", find = "%swritten" },
                            { event = "msg_show", find = "%d+L,%s%d+B" }, -- skip save notifications
                            { event = "msg_show", find = "^E486: Pattern not found:" },
                        },
                    },
                    opts = { skip = true },
                },
                { filter = { event = "msg_show", cmdline = "^:lua" }, view = "messages" }, -- send lua output to split
                { filter = { event = "msg_show", cmdline = "^:=" }, view = "messages" }, -- send lua output to split
                { filter = { event = "msg_show", min_height = 20 }, view = "messages" }, -- send long messages to split
            },
        })
        notify.setup({
            icons = nonicons_extention.icons,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { focusable = true })
            end,
        })
    end,
}
