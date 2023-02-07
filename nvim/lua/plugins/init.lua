return {
    -- Bigfile
    { "LunarVim/bigfile.nvim", event = "BufReadPre" },

    -- Colorizer
    { "norcalli/nvim-colorizer.lua", ft = { "css" } },

    -- Editor Config
    { "gpanders/editorconfig.nvim", event = "BufReadPre" },

    -- BetterScape
    { "max397574/better-escape.nvim", event = "InsertEnter", config = true },

    -- Todo Comments
    { "folke/todo-comments.nvim", event = "BufReadPost", dependencies = "nvim-lua/plenary.nvim", config = true },
}
