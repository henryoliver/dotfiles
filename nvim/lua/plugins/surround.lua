return {
    "echasnovski/mini.surround",
    event = "VeryLazy",
    opts = {
        -- Avoid the `s*` prefix because substitute.nvim owns `s` as an operator.
        mappings = {
            add = "ys",
            delete = "ds",
            replace = "cs",
            find = "",
            find_left = "",
            highlight = "",
            update_n_lines = "",
            suffix_last = "",
            suffix_next = "",
        },
    },
}
