return {
    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        opts = {
            openai_params = {
                model = "gpt-3.5-turbo",
            },
            openai_edit_params = {
                model = "code-davinci-edit-001",
            },
        },
        init = function()
            -- Mappings
            vim.keymap.set("n", "<leader>ic", ":ChatGPT<cr>", { desc = "ChatGPT" })
            vim.keymap.set("n", "<leader>ia", ":ChatGPTActAs<cr>", { desc = "Awesome ChatGPT Prompts" })
            vim.keymap.set({ "n", "v" }, "<leader>ie", ":ChatGPTEditWithInstructions<cr>", { desc = "Edit Window" })
            vim.keymap.set("n", "<leader>io", ":ChatGPTRun optimize_code<cr>", { desc = "Optimize Code" })
            vim.keymap.set("n", "<leader>is", ":ChatGPTRun summarize<cr>", { desc = "Summarize" })
            vim.keymap.set("n", "<leader>if", ":ChatGPTRun fix_bugs<cr>", { desc = "Fix Bugs" })
            vim.keymap.set("n", "<leader>ix", ":ChatGPTRun explain_code<cr>", { desc = "Explain Code" })
            vim.keymap.set("n", "<leader>ir",
                ":ChatGPTRun code_readability_analysis<cr>", { desc = "Code Readability Analysis" })
        end,
    },
}
