local spec = {
    "windwp/nvim-spectre",
    keys = "<leader>f",
    dependencies = "nvim-lua/plenary.nvim",
}

function spec:init()
    local spectre = require("spectre")

    -- Mappings
    vim.keymap.set("n", "<leader>fp", spectre.open, { desc = "Project-Wide" })
    vim.keymap.set("n", "<leader>fb", spectre.open_file_search, { desc = "Buffer" })
    vim.keymap.set("n", "<leader>fw", function() spectre.open_visual({ select_word = true }) end, { desc = "Current Word" })
end

function spec:config()
    local spectre = require("spectre")

    spectre.setup()
end

return spec
