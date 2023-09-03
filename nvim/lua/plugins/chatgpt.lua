return {
    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        opts = {
            openai_params = {
                model = "gpt-4",
                -- model = "gpt-3.5-turbo",
            },
            openai_edit_params = {
                model = "gpt-4",
                -- model = "code-davinci-edit-001",
            },
            popup_layout = {
                default = "right",
            },
        },
        init = function()
            -- Mappings
            local wk = require("which-key")

            wk.register({
                i = {
                    name = "ChatGPT",
                    c = { ":ChatGPT<cr>", "ChatGPT" },
                    e = { ":ChatGPTEditWithInstruction<cr>", "Edit with instruction" },
                    g = { ":ChatGPTRun grammar_correction<cr>", "Grammar Correction" },
                    k = { ":ChatGPTRun keywords<cr>", "Keywords" },
                    a = { ":ChatGPTRun add_tests<cr>", "Add Tests" },
                    o = { ":ChatGPTRun optimize_code<cr>", "Optimize Code" },
                    s = { ":ChatGPTRun summarize<cr>", "Summarize" },
                    f = { ":ChatGPTRun fix_bugs<cr>", "Fix Bugs" },
                    x = { ":ChatGPTRun explain_code<cr>", "Explain Code" },
                    l = { ":ChatGPTRun code_readability_analysis<cr>", "Code Readability Analysis" }
                },
                { prefix = "<leader>", mode = { "n", "v" } }
            })
        end,
    },
}
