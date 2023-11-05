return {
    -- ChatGPT
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
                model = "gpt-4",
                max_tokens = 1000,
            },
            openai_edit_params = {
                model = "gpt-4",
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
            actions_paths = { "~/.config/others/gpt-actions.json" },
        },
        init = function()
            -- Mappings
            local wk = require("which-key")
            local chatgpt = require("chatgpt")

            wk.register({
                i = {
                    c = {
                        name = "ChatGPT",
                        c = { chatgpt.openChat, "ChatGPT" },
                        l = { chatgpt.complete_code, "Complete code" },
                        e = { chatgpt.edit_with_instructions, "Edit with instruction" },
                        -- Actions
                        r = { ":ChatGPTRun refactor_code<cr>", "Code refactoring" },
                    },
                },
            }, { prefix = "<leader>", mode = { "n", "v" } })
        end,
    },
}
