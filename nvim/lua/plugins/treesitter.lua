return {
    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            auto_install = true,
            ensure_installed = {
                "bash",
                "css",
                "dockerfile",
                "git_config",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "ruby",
                "rust",
                "svelte",
                "typescript",
                "tsx",
                "vim",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<c-l>", -- set to `false` to disable one of the mappings
                    node_incremental = "<c-j>",
                    scope_incremental = false,
                    node_decremental = "<c-k>",
                },
            },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                },
            },
        })
    end,
}
