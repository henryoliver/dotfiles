return {
    -- ChatGPT
    -- ChatGPT is a Neovim plugin that allows you to effortlessly utilize the OpenAI ChatGPT API, empowering you to generate natural language responses from OpenAI's ChatGPT directly within the editor in response to your inquiries.
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        -- Config: ChatGPT.nvim/lua/chatgpt/config.lua
        opts = {
            openai_params = {
                model = "gpt-4-turbo",
                max_tokens = 1000,
            },
            openai_edit_params = {
                model = "gpt-4-turbo",
            },
            popup_layout = {
                default = "right",
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
                { "<leader>i", group = "ChatGPT" },
                { "<leader>ic", chatgpt.openChat, desc = "ChatGPT" },
                { "<leader>ie", chatgpt.edit_with_instructions, desc = "Edit with instruction" },
                { "<leader>il", chatgpt.complete_code, desc = "Complete code" },
                { "<leader>ir", ":ChatGPTRun refactor_code<cr>", desc = "Refactor code" },
                { "<leader>ix", ":ChatGPTRun explain_code<cr>", desc = "Explain code" },
            })
        end,
    },
}
