return {
    -- Spectre
    "windwp/nvim-spectre",
    lazy = true,
    keys = "<leader>f",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
        -- Mappings
        local wk = require("which-key")
        local spectre = require("spectre")

        wk.register({
            f = {
                name = "Find & Replace",
                p = { spectre.open, "Project-Wide" },
                b = { spectre.open_file_search, "Buffer" },
                w = { function() spectre.open_visual({ select_word = true }) end, "Current Word" }
            },
        }, { prefix = "<leader>", mode = "n" })
    end
}
