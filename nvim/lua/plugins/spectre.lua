return {
    -- Spectre
    {
        "windwp/nvim-spectre",
        cmd = "Spectre",
        dependencies = "nvim-lua/plenary.nvim",
        -- Mappings
        init = function()
            require("which-key").register({
                ["<Leader>f"] = { name = "Find & Replace" },
                ["<Leader>fp"] = { "<Cmd>lua require('spectre').open()<CR>", "Project-Wide" },
                ["<Leader>fb"] = { "<Cmd>lua require('spectre').open_file_search()<CR>", "Buffer" },
                ["<Leader>fw"] = {
                    "<Cmd>lua require('spectre').open_visual({ select_word = true })<CR>",
                    "Current Word",
                },
            })

            require("which-key").register({
                ["<Leader>f"] = { name = "Find & Replace" },
                ["<Leader>fr"] = { "<Cmd>lua require('spectre').open_visual()<CR>", "Find & Replace Selection" },
            }, { mode = "v" })
        end,
    },
}
