return {
    -- Nvterm
    "NvChad/nvterm",
    lazy = true,
    keys = "<leader>t",
    opts = {
        terminals = {
            type_opts = {
                float = { border = "rounded" },
                horizontal = { location = "rightbelow", split_ratio = .3, },
                vertical = { location = "rightbelow", split_ratio = .5 },
            }
        }
    },
    config = true,
    init = function()
        local terminal = require("nvterm.terminal")

        -- Mappings
        vim.keymap.set({ "n", "t" }, "<leader>tf", function() terminal.toggle("float") end, { desc = "Float" })
        vim.keymap.set({ "n", "t" }, "<leader>th", function() terminal.toggle("horizontal") end, { desc = "Horizontal" })
        vim.keymap.set({ "n", "t" }, "<leader>tv", function() terminal.toggle("vertical") end, { desc = "Vertical" })
    end
}
