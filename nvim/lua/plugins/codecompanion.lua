return {
    ---@type LazySpec
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local nonicons = require("nvim-nonicons")
        local codecompanion = require("codecompanion")
        local codecompanion_adapters = require("codecompanion.adapters")

        -- https://codecompanion.olimorris.dev/getting-started.html#variables
        codecompanion.setup({
            strategies = {
                chat = { adapter = "anthropic" },
                inline = { adapter = "anthropic" },
                cmd = { adapter = "anthropic" },
            },
            sources = {
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
            },
            adapters = {
                opts = {
                    show_defaults = false,
                },
                anthropic = function()
                    return codecompanion_adapters.extend("anthropic", {
                        schema = {
                            model = {
                                -- https://docs.anthropic.com/en/docs/about-claude/models/all-models
                                default = "claude-3-7-sonnet-latest",
                            },
                        },
                    })
                end,
                openai = function()
                    return codecompanion_adapters.extend("openai", {
                        schema = {
                            model = {
                                -- https://platform.openai.com/docs/models/compare
                                default = "o4-mini",
                            },
                        },
                    })
                end,
            },
            display = {
                action_palette = {
                    provider = "telescope",
                },
                chat = {
                    show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
                    separator = nonicons.get("horizontal-rule"), -- The separator between the different messages in the chat buffer
                    show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
                    show_settings = false, -- Show LLM settings at the top of the chat buffer?
                    show_token_count = false, -- Show the token count for each response?
                    start_in_insert_mode = true, -- Open the chat buffer in insert mode?

                    -- Change the default icons
                    icons = {
                        pinned_buffer = "" .. nonicons.get("milestone") .. " ",
                        watched_buffer = "" .. nonicons.get("eye") .. " ",
                    },

                    -- Options to customize the UI of the chat buffer
                    window = {
                        layout = "vertical", -- float|vertical|horizontal|buffer
                        position = nil, -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
                        border = "single", -- none, single, double, rounded, solid
                        -- height = 0.8,
                        -- width = 0.8,
                        -- full_height = false, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
                        relative = "editor",
                        opts = {
                            signcolumn = "no", -- disable signcolumn
                            number = false, -- disable number column
                            relativenumber = false, -- disable relative numbers
                            foldenable = false, -- when off, all folds are open
                            breakindent = true,
                            cursorcolumn = false,
                            cursorline = false,
                            foldcolumn = "0",
                            linebreak = true,
                            list = false,
                            numberwidth = 1,
                            spell = false,
                            wrap = true,
                        },
                    },
                },
                diff = {
                    enabled = true,
                    close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
                    layout = "vertical", -- vertical|horizontal split for default provider
                    opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
                    provider = "default", -- default|mini_diff
                },
            },
        })
    end,
    keys = {
        -- https://codecompanion.olimorris.dev/getting-started.html#list-of-commands
        { "<Leader>icc", "<Cmd>CodeCompanionChat<CR>", mode = "n", desc = "Chat" },
        { "<Leader>ict", "<Cmd>CodeCompanionChat Toggle<CR>", mode = "n", desc = "Toggle" },

        { "<Leader>ico", "<Cmd>CodeCompanionChat openai<CR>", mode = "n", desc = "Chat OpenAI" },
        { "<Leader>icn", "<Cmd>CodeCompanionChat anthropic<CR>", mode = "n", desc = "Chat ClaudeAI" },

        { "<Leader>icm", "<Cmd>CodeCompanionCmd<CR>", mode = "n", desc = "Generate Command" },
        { "<Leader>ica", "<Cmd>CodeCompanionActions<CR>", mode = "n", desc = "Action Palette" },

        { "<Leader>ica", "<Cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "Add Chat" },

        -- https://codecompanion.olimorris.dev/getting-started#inline-assistant
        { "<Leader>ici", "<Cmd>CodeCompanion<CR>", mode = "v", desc = "Inline" },
        { "<Leader>ico", "<Cmd>CodeCompanion openai<CR>", mode = "v", desc = "Inline OpenAI" },
        { "<Leader>icn", "<Cmd>CodeCompanion anthropic<CR>", mode = "v", desc = "Inline ClaudeAI" },
    },
}
