return {
    -- Spectre
    -- A search panel for neovim.
    "windwp/nvim-spectre",
    lazy = true,
    cmd = "Spectre",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
        -- Mappings
        local wk = require("which-key")
        local spectre = require("spectre")

        wk.add({
            { "<leader>f", group = "Find & Replace" },
            { "<leader>fb", spectre.open_file_search, desc = "Buffer" },
            { "<leader>fp", spectre.open, desc = "Project-Wide" },
            {
                "<leader>fw",
                function()
                    spectre.open_visual({ select_word = true })
                end,
                desc = "Current Word",
            },
        })
    end,
}
