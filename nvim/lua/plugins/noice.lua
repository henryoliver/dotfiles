return {
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

        -- Setup notify first
        notify.setup({
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { focusable = false })
            end,
            render = "wrapped-compact",
            stages = "fade_in_slide_out",
            top_down = false,
            icons = nonicons_extention.icons,
        })

        noice.setup({
            -- LSP integration
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                signature = {
                    enabled = false, -- Disable if you have cmp-nvim-lsp-signature-help
                },
                hover = {
                    enabled = true,
                },
                documentation = {
                    view = "hover",
                    opts = {
                        lang = "markdown",
                        replace = true,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 3 },
                    },
                },
            },

            -- Presets
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false, -- Only enable if you use inc-rename.nvim
                lsp_doc_border = true,
            },

            -- Message routing
            routes = {
                -- Show recording messages
                {
                    filter = { event = "msg_showmode" },
                    view = "notify",
                },
                -- Silence unwanted messages
                {
                    filter = {
                        any = {
                            -- File tree plugins
                            { find = "NvimTree.*" },
                            { find = "neo%-tree" },
                            { find = "oil%.nvim" },
                            -- Search/telescope
                            { find = "telescope" },
                            { find = "file_browser" },
                            -- General noise
                            { event = "msg_showcmd" },
                            { event = "msg_ruler" },
                            { event = "msg_show", kind = "" },
                            { event = "msg_show", kind = "search_count" },
                            -- File operations
                            { event = "msg_show", find = "written" },
                            { event = "msg_show", find = "%d+L, %d+B" },
                            { event = "msg_show", find = "^%d+ lines yanked" },
                            { event = "msg_show", find = "^%d+ fewer lines" },
                            { event = "msg_show", find = "^%d+ more lines" },
                            { event = "msg_show", find = "^%d+ lines indented" },
                            -- Search messages
                            { event = "msg_show", find = "^E486: Pattern not found" },
                            { event = "msg_show", find = "^search hit BOTTOM" },
                            { event = "msg_show", find = "^search hit TOP" },
                            -- LSP noise
                            { event = "msg_show", find = "No information available" },
                            -- Plugin noise
                            { find = "which%-key" },
                            { find = "lazy%.nvim" },
                        },
                    },
                    opts = { skip = true },
                },
                -- Send specific outputs to messages view
                {
                    filter = {
                        any = {
                            { event = "msg_show", cmdline = "^:lua" },
                            { event = "msg_show", cmdline = "^:=" },
                        },
                    },
                    view = "messages",
                },
                -- Send long messages to split
                {
                    filter = { event = "msg_show", min_height = 20 },
                    view = "messages",
                },
            },

            -- Command line
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
                },
            },

            -- Messages
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },

            -- Popupmenu
            popupmenu = {
                enabled = true,
                backend = "nui",
                kind_icons = {},
            },

            -- Notifications
            notify = {
                enabled = true,
                view = "notify",
            },

            -- Health check suppressions
            health = {
                checker = false, -- Disable health checks for noice
            },
        })
    end,
}
