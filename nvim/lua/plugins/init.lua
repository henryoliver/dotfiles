return {
    -- Bufdelete
    { "famiu/bufdelete.nvim", event = "BufReadPost" },

    -- Bigfile
    { "LunarVim/bigfile.nvim", event = "BufReadPre" },

    -- Colorizer
    { "norcalli/nvim-colorizer.lua", ft = { "css" }, opts = { "css" } },

    -- Todo Comments
    { "folke/todo-comments.nvim", event = "BufReadPost", dependencies = "nvim-lua/plenary.nvim", config = true },

    -- HardTime
    {
        "m4xshen/hardtime.nvim",
        event = "BufReadPost",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        config = true,
    },
}
