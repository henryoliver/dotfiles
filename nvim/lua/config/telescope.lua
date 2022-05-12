local telescope = require("telescope")

telescope.setup({
    defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        file_ignore_patterns = { "^cypress/", "package-lock.json" },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
})

-- Plugins
telescope.load_extension("fzy_native")
