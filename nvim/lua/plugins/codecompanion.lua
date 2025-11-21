return {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",
        "nvim-treesitter/nvim-treesitter",
        "franco-ruggeri/codecompanion-spinner.nvim",
    },
    opts = {
        opts = {
            system_prompt = "",
        },
        strategies = {
            chat = {
                adapter = "anthropic",
                opts = {
                    completion_provider = "cmp",
                },
            },
            inline = { adapter = "anthropic" },
            cmd = { adapter = "anthropic" },
        },
        keymaps = {
            send = {
                callback = function(chat)
                    vim.cmd("stopinsert")
                    chat:submit()
                    chat:add_buf_message({ role = "llm", content = "" })
                end,
                index = 1,
                description = "Send",
            },
        },
        sources = {
            per_filetype = {
                codecompanion = { "codecompanion" },
            },
        },
        adapters = {
            http = {
                opts = {
                    show_defaults = false,
                },
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        schema = {
                            model = {
                                default = "claude-sonnet-4-5",
                            },
                        },
                    })
                end,
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        schema = {
                            model = {
                                default = "o1",
                            },
                        },
                    })
                end,
                xai = function()
                    return require("codecompanion.adapters").extend("xai", {
                        schema = {
                            model = {
                                default = "grok-2-latest",
                            },
                        },
                    })
                end,
            },
            acp = {
                claude_code = function()
                    return require("codecompanion.adapters").extend("claude_code", {
                        -- No API key needed - uses your existing Claude CLI authentication
                        env = {
                            api_key = "cmd:echo ''", -- Empty string to avoid API key requirement
                        },
                        schema = {
                            model = {
                                default = "claude-sonnet-4-5",
                            },
                        },
                    })
                end,
            },
        },
        display = {
            chat = {
                intro_message = "",
                show_token_count = true,
                icons = {
                    pinned_buffer = "" .. require("nvim-nonicons").get("milestone") .. " ",
                    watched_buffer = "" .. require("nvim-nonicons").get("eye") .. " ",
                },
                window = {
                    layout = "vertical",
                    border = "single",
                    title = "",
                    style = "minimal",
                    opts = {
                        number = false,
                        relativenumber = false,
                        colorcolumn = "",
                        foldenable = false,
                        foldmethod = "manual",
                        foldlevel = 99,
                        winblend = 0,
                    },
                },
            },
            diff = {
                enabled = true,
                layout = "float",
                dim = 0,
                window = {
                    border = "single",
                    relative = "editor",
                    title = "",
                    style = "minimal",
                },
            },
        },
        extensions = {
            spinner = {},
        },
    },
    keys = {
        -- Chat with specific adapters
        { "<Leader>ic", "<Cmd>CodeCompanionChat claude_code<CR>", desc = "Chat Claude Code" },
        { "<Leader>io", "<Cmd>CodeCompanionChat openai<CR>", desc = "Chat OpenAI" },
        { "<Leader>il", "<Cmd>CodeCompanionChat anthropic<CR>", desc = "Chat Claude" },
        { "<Leader>ik", "<Cmd>CodeCompanionChat xai<CR>", desc = "Chat Grok" },
    },
}
