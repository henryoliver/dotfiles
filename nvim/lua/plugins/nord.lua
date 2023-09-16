return {
    -- Nord
    "gbprod/nord.nvim",
    priority = 1000,
    config = function()
        require("nord").setup({
            -- https://github.com/gbprod/nord.nvim/blob/39bfd79a9cb57eb7a652d12782c030d86e0095c0/lua/nord/defaults.lua
            on_highlights = function(highlights, colors)
                highlights.IncSearch = { fg = colors.snow_storm.brightest, bg = colors.frost.ice } -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            end,
        })

        vim.cmd.colorscheme("nord")
    end,
}
