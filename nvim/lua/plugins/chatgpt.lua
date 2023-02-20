return {
    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        keys = { "<Leader>i", { "<Leader>i", mode = "v" } },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>i"] = { name = "ChatGPT" },
                ["<Leader>ic"] = { "<Cmd>ChatGPT<CR>", "ChatGPT" },
                ["<Leader>ia"] = { "<Cmd>ChatGPTActAs<CR>", "Awesome ChatGPT Prompts" },
                ["<Leader>ie"] = { "<Cmd>ChatGPTEditWithInstructions<CR>", "Edit Window" },
            })

            require("which-key").register({
                ["<Leader>i"] = { name = "ChatGPT" },
                ["<Leader>ie"] = { "<Cmd>ChatGPTEditWithInstructions<CR>", "Edit Selection" },
            }, { mode = "v" })
        end,
    },
}
