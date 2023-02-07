return {
    -- Spectre
    {
        "windwp/nvim-spectre",
        cmd = "Spectre",
        dependencies = "nvim-lua/plenary.nvim",
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>fr"] = { name = "Find & Replace" },
                ["<Leader>frp"] = { "<Cmd>lua require('spectre').open()<CR>", "Project-Wide" },
                ["<Leader>frb"] = { "<Cmd>lua require('spectre').open_file_search()<CR>", "Buffer" },
                ["<Leader>frw"] = {
                    "<Cmd>lua require('spectre').open_visual({ select_word = true })<CR>",
                    "Current Word",
                },
            })

            require("which-key").register({
                ["<Leader>fr"] = { "<Cmd>lua require('spectre').open_visual()<CR>", "Find & Replace Selection" },
            }, { mode = "v" })
        end,
    },
}
