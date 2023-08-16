return {
    -- Bigfile
    { "LunarVim/bigfile.nvim", event = "BufReadPre" },

    -- Colorizer
    { "norcalli/nvim-colorizer.lua", ft = { "css" }, opts = { "css" } },

    -- Todo Comments
    { "folke/todo-comments.nvim", event = "BufReadPost", dependencies = "nvim-lua/plenary.nvim", config = true },
}
