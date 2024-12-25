return {
    -- Nvim-Lint
    -- An asynchronous linter plugin for Neovim
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                javascript = { "eslint_d" },
                typescript = { "eslint_d" },
            }
        end,
    },
}
