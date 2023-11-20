return {
    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        local ts_context_commentstring = require("ts_context_commentstring")

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
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                },
            },
        })

        vim.g.skip_ts_context_commentstring_module = true -- skip backwards compatibility routines and speed up loading.
        ts_context_commentstring.setup({ enable_autocmd = false })
    end,
}
