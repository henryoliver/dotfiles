require("staline").setup({
    sections = {
        left = { "  ", "mode", " ", "branch", " ", "lsp" },
        mid = {},
        right = { "file_name", "line_column" },
    },
    mode_colors = {
        i = "#d8dee9",
        n = "#8fbcbb",
        c = "#88c0d0",
        v = "#bf616a",
    },
    defaults = {
        true_colors = true,
        line_column = " [%l/%L] :%c  ",
        branch_symbol = " ",
    },
})
