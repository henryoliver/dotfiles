return {
    -- Claude Code
    -- A seamless integration between Claude Code AI assistant and Neovim
    {
        "greggh/claude-code.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- Config: https://github.com/greggh/claude-code.nvim?tab=readme-ov-file#configuration
        config = function()
            require("claude-code").setup({
                -- Terminal window settings
                window = {
                    height_ratio = 0.4, -- Percentage of screen height for the terminal window
                },
            })
        end,
        init = function()
            -- Mappings
            local wk = require("which-key")

            wk.add({
                mode = { "n", "v" },
                { "<leader>i", group = "AI" },
                { "<leader>ia", ":ClaudeCode<cr>", desc = "Claude" },
            })
        end,
    },
    -- ChatGPT
    -- ChatGPT is a Neovim plugin that allows you to effortlessly utilize the OpenAI ChatGPT API, empowering you to generate natural language responses from OpenAI's ChatGPT directly within the editor in response to your inquiries.
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim",
        },
        -- Config: ChatGPT.nvim/lua/chatgpt/config.lua
        opts = {
            openai_params = {
                model = "gpt-4o",
                max_tokens = 4095,
            },
            openai_edit_params = {
                model = "gpt-4o",
                max_tokens = 4095,
            },
            popup_layout = {
                default = "right",
                center = {
                    width = "84%",
                    height = "84%",
                },
            },
            popup_window = {
                border = {
                    text = {
                        top = "",
                    },
                },
            },
            chat = {
                sessions_window = {
                    active_sign = "  ",
                    inactive_sign = "  ",
                },
            },
            actions_paths = { "~/.config/others/gpt-actions.json" },
        },
        init = function()
            -- Mappings
            local wk = require("which-key")
            local chatgpt = require("chatgpt")

            wk.add({
                mode = { "n", "v" },
                { "<leader>i", group = "AI" },
                { "<leader>ic", chatgpt.openChat, desc = "ChatGPT" },
                { "<leader>ie", chatgpt.edit_with_instructions, desc = "ChatGPT edit with instruction" },
                { "<leader>il", chatgpt.complete_code, desc = "ChatGPT Complete code" },
                { "<leader>ir", ":ChatGPTRun refactor_code<cr>", desc = "ChatGPT refactor code" },
                { "<leader>ix", ":ChatGPTRun explain_code<cr>", desc = "ChatGPT explain code" },
            })
        end,
    },
}
