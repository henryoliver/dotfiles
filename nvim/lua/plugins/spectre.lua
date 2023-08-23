return {
    -- Spectre
    "windwp/nvim-spectre",
    lazy = true,
    keys = "<leader>f",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
        local spectre = require("spectre")

        -- Mappings
        vim.keymap.set("n", "<leader>fp", spectre.open, { desc = "Project-Wide" })
        vim.keymap.set("n", "<leader>fb", spectre.open_file_search, { desc = "Buffer" })
        vim.keymap.set("n", "<leader>fw", function() spectre.open_visual({ select_word = true }) end,
            { desc = "Current Word" })
    end
}
