return {
    -- Gen
    {
        "David-Kunz/gen.nvim",
        event = "VeryLazy",
        init = function()
            -- Mappings
            local wk = require("which-key")

            wk.register({
                i = {
                    g = { ":Gen<cr>", "Gen" },
                },
            }, { prefix = "<leader>", mode = { "n", "v" } })
        end,
    },
}
