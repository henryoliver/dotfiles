return {
    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        cmd = "ChatGPT",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>i"] = { name = "ChatGPT" },
                ["<Leader>ic"] = { "<Cmd>ChatGPT<CR>", "ChatGPT" },
                ["<Leader>ia"] = { "<Cmd>ChatGPTActAs<CR>", "Awesome ChatGPT Prompts" },
                ["<Leader>ie"] = { "<Cmd>ChatGPTEditWithInstructions<CR>", "Edit Selection or Window" },
            })
        end,
    },
}
