return {
    -- Nonicons
    {
        "yamatsum/nvim-nonicons",
        priority = 100,
        dependencies = "kyazdani42/nvim-web-devicons"
    },

    -- Colorizer
    { "norcalli/nvim-colorizer.lua", lazy = true, ft = "css", opts = { "css" } },
}
