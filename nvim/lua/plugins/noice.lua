return {
    -- Noice
    -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
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
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,
        },
        routes = {
            { -- Show @recording messages
                view = "notify",
                filter = { event = "msg_showmode" },
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
    },
}
