local function toggle_chat_with(adapter, model)
    return function()
        local codecompanion = require("codecompanion")
        local chat = codecompanion.last_chat()

        if not chat then
            local parts = { "CodeCompanionChat", "Toggle", "adapter=" .. adapter }
            if model then
                table.insert(parts, "model=" .. model)
            end
            vim.cmd(table.concat(parts, " "))
            return
        end

        local current_adapter = chat.adapter and chat.adapter.name or nil
        local current_model = chat.adapter
            and chat.adapter.schema
            and chat.adapter.schema.model
            and chat.adapter.schema.model.default
            or nil

        if chat.ui:is_visible() and current_adapter == adapter and current_model == model then
            chat.ui:hide()
            return
        end

        local function open_chat()
            if chat.ui:is_visible_non_curtab() then
                codecompanion.close_last_chat()
            elseif chat.ui:is_visible() then
                chat.ui:hide()
            end

            chat.ui:open({ toggled = true })
        end

        local function apply_chat_target()
            if model and current_model ~= model then
                chat:change_model({ model = model })
            end
            open_chat()
        end

        if current_adapter ~= adapter then
            chat:change_adapter(adapter, vim.schedule_wrap(apply_chat_target))
            return
        end

        apply_chat_target()
    end
end

local function inline_with(adapter)
    return function()
        vim.cmd("CodeCompanion adapter=" .. adapter)
    end
end

local function cli_with(agent)
    return function()
        vim.cmd("CodeCompanionCLI agent=" .. agent)
    end
end

return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
        "CodeCompanion",
        "CodeCompanionChat",
        "CodeCompanionCLI",
        "CodeCompanionCmd",
        "CodeCompanionActions",
    },
    keys = {
        { "<Leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions / Prompt Library" },
        {
            "<Leader>ac",
            toggle_chat_with("anthropic", "claude-sonnet-4-6"),
            mode = { "n", "v" },
            desc = "Claude Sonnet 4.6 Chat / Reasoning",
        },
        {
            "<Leader>ai",
            inline_with("openai"),
            mode = { "n", "v" },
            desc = "OpenAI GPT-4.1 Inline / Focused Edits",
        },
        { "<Leader>ad", "<cmd>CodeCompanionCmd<cr>", mode = "n", desc = "Claude Sonnet 4.6 / Shell Commands" },
        { "<Leader>al", cli_with("claude_code"), mode = "n", desc = "Claude Code CLI / Repo Agent" },
        { "<Leader>ax", cli_with("codex"), mode = "n", desc = "Codex CLI / Repo Agent" },
        { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Selection to Active Chat" },
    },
    config = function()
        local colors = require("nord.colors").palette

        require("codecompanion").setup({
        --------------------------------------------------------------------------
        -- Adapters
        --------------------------------------------------------------------------
        adapters = {
            http = {
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        schema = {
                            model = {
                                default = "claude-sonnet-4-6",
                            },
                        },
                        env = {
                            api_key = "ANTHROPIC_API_KEY",
                        },
                    })
                end,
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        env = {
                            api_key = "OPENAI_API_KEY",
                        },
                    })
                end,
                opts = {
                    show_presets = false,
                },
            },
            acp = {
                -- Claude Code via ACP (requires: npm install -g @anthropic-ai/claude-code)
                -- and the Zed ACP adapter (https://github.com/zed-industries/claude-agent-acp)
                claude_code = function()
                    return require("codecompanion.adapters").extend("claude_code", {
                        env = {
                            ANTHROPIC_API_KEY = "ANTHROPIC_API_KEY",
                        },
                    })
                end,
                -- Codex via ACP (requires: https://github.com/zed-industries/codex-acp)
                codex = function()
                    return require("codecompanion.adapters").extend("codex", {
                        defaults = {
                            auth_method = "openai-api-key",
                        },
                        env = {
                            OPENAI_API_KEY = "OPENAI_API_KEY",
                        },
                    })
                end,
                opts = {
                    show_presets = false,
                },
            },
        },

        --------------------------------------------------------------------------
        -- Interactions (formerly "strategies")
        --------------------------------------------------------------------------
        interactions = {
            chat = {
                adapter = {
                    name = "anthropic",
                    model = "claude-sonnet-4-6",
                },
                roles = {
                    llm = function(adapter)
                        return "CodeCompanion (" .. adapter.formatted_name .. ")"
                    end,
                    user = "Henry",
                },
                keymaps = {
                    send = {
                        modes = {
                            n = { "<CR>", "<C-s>" },
                            i = "<C-s>",
                        },
                    },
                    close = {
                        modes = {
                            n = "<C-c>",
                            i = "<C-c>",
                        },
                    },
                },
                tools = {
                    opts = {
                        auto_submit_errors = true,
                        auto_submit_success = true,
                    },
                },
                slash_commands = {
                    ["file"] = {
                        opts = {
                            provider = "telescope",
                        },
                    },
                    ["symbols"] = {
                        opts = {
                            provider = "telescope",
                        },
                    },
                    ["buffer"] = {
                        opts = {
                            provider = "telescope",
                        },
                    },
                },
            },
            inline = {
                adapter = {
                    name = "openai",
                },
            },
            cmd = {
                adapter = "anthropic",
            },
            -- CLI interaction for ACP agents (Claude Code, Codex)
            cli = {
                agent = "claude_code",
                agents = {
                    claude_code = {
                        cmd = "claude",
                        args = {},
                        description = "Claude Code CLI",
                        provider = "terminal",
                    },
                    codex = {
                        cmd = "codex",
                        args = {},
                        description = "Codex CLI",
                        provider = "terminal",
                    },
                },
            },
        },

        --------------------------------------------------------------------------
        -- Display
        --------------------------------------------------------------------------
        display = {
            action_palette = {
                provider = "telescope",
            },
            chat = {
                window = {
                    layout = "vertical",
                    width = 0.45,
                    border = "rounded",
                    opts = {
                        breakindent = true,
                        linebreak = true,
                        wrap = true,
                    },
                },
                auto_scroll = true,
                show_header_separator = false,
                show_settings = false,
                show_token_count = true,
                start_in_insert_mode = false,
                fold_reasoning = true,
                show_reasoning = true,
            },
            diff = {
                enabled = true,
                threshold_for_chat = 6,
                word_highlights = {
                    additions = true,
                    deletions = true,
                },
            },
            inline = {
                layout = "vertical",
            },
        },

        --------------------------------------------------------------------------
        -- General options
        --------------------------------------------------------------------------
        opts = {
            log_level = "ERROR",
            language = "English",
            send_code = true,
        },
        })

        -- Nord-themed CodeCompanion highlights
        vim.api.nvim_set_hl(0, "CodeCompanionChatHeader", { fg = colors.frost.artic_water, bold = true })
        vim.api.nvim_set_hl(0, "CodeCompanionChatSeparator", { fg = colors.polar_night.brightest })
        vim.api.nvim_set_hl(0, "CodeCompanionChatTokens", { fg = colors.polar_night.brightest, italic = true })
        vim.api.nvim_set_hl(0, "CodeCompanionChatTool", { fg = colors.frost.ice })
        vim.api.nvim_set_hl(0, "CodeCompanionChatInfo", { fg = colors.frost.artic_water })
        vim.api.nvim_set_hl(0, "CodeCompanionChatWarn", { fg = colors.aurora.yellow })
        vim.api.nvim_set_hl(0, "CodeCompanionChatError", { fg = colors.aurora.red })
        vim.api.nvim_set_hl(0, "CodeCompanionVirtualText", { fg = colors.polar_night.brightest, italic = true })
    end,
}
