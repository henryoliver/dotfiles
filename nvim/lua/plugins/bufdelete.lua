return {
    -- BufDelete
    -- Neovim's default :bdelete command can be quite annoying, since it also messes up your entire window layout by deleting windows.
    { "famiu/bufdelete.nvim", lazy = true, cmd = { "Bdelete", "Bwipeout" } },
}
