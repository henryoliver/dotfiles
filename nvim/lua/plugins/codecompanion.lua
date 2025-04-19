return {
    ---@type LazySpec
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local codecompanion = require("codecompanion")
        local codecompanion_adapters = require("codecompanion.adapters")

        -- https://codecompanion.olimorris.dev/getting-started.html#variables
        codecompanion.setup({
            strategies = {
                chat = { adapter = "anthropic" },
                inline = { adapter = "anthropic" },
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
            },
        })
    end,
    keys = {
        { "<Leader>ic", "<Cmd>CodeCompanionChat openai<CR>", desc = "Chat OpenAI" },
        { "<Leader>io", "<Cmd>CodeCompanionChat anthropic<CR>", desc = "Chat ClaudeAI" },
        { "<Leader>it", "<Cmd>CodeCompanionChat Toggle<CR>", desc = "Chat" },
        { "<Leader>ii", "<Cmd>CodeCompanion<CR>", desc = "Inline" },
        { "<Leader>ia", "<Cmd>CodeCompanionActions<CR>", desc = "Action Palette" },
        { "<Leader>ia", "<Cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "Chat Add" },
    },
}
