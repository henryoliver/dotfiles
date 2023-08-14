return {
    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        commit = "2107f7037c775bf0b9bff9015eed68929fcf493e",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        opts = {
            openai_params = {
                model = "gpt-3.5-turbo",
            },
            openai_edit_params = {
                model = "code-davinci-edit-001",
            },
        },
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>i"] = { name = "ChatGPT" },
                ["<Leader>ic"] = { "<Cmd>ChatGPT<CR>", "ChatGPT" },
                ["<Leader>ia"] = { "<Cmd>ChatGPTActAs<CR>", "Awesome ChatGPT Prompts" },
                ["<Leader>ie"] = { "<Cmd>ChatGPTEditWithInstructions<CR>", "Edit Window" },
                ["<Leader>io"] = { "<Cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
                ["<Leader>is"] = { "<Cmd>ChatGPTRun summarize<CR>", "Summarize" },
                ["<Leader>if"] = { "<Cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
                ["<Leader>ix"] = { "<Cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
                ["<Leader>ir"] = { "<Cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
            })

            require("which-key").register({
                ["<Leader>i"] = { name = "ChatGPT" },
                ["<Leader>ie"] = { "<Cmd>ChatGPTEditWithInstructions<CR>", "Edit Selection" },
            }, { mode = "v" })
        end,
    },
}
