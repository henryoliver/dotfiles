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
        opts = {
            openai_params = {
                model = "gpt-4-0125-preview",
                max_tokens = 1000,
            },
            openai_edit_params = {
                model = "gpt-4-0125-preview",
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

            wk.register({
                i = {
                    name = "ChatGPT",
                    c = { chatgpt.openChat, "ChatGPT" },
                    l = { chatgpt.complete_code, "Complete code" },
                    e = { chatgpt.edit_with_instructions, "Edit with instruction" },
                    -- Actions
                    r = { ":ChatGPTRun refactor_code<cr>", "Code refactoring" },
                    -- r = { chatgpt.run_action("refactor_code"), "Refactor code" },
                },
            }, { prefix = "<leader>", mode = { "n", "v" } })
        end,
    },
}
