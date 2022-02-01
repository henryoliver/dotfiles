require('which-key').setup({
    plugins = {
        marks = false,
        registers = false,
        spelling = {
            enabled = false,
            suggestions = 20,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = false,
            windows = true,
            nav = false,
            z = true,
            g = true,
        },
    },
    ignore_missing = false,
})
