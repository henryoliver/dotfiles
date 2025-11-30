return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
        treesitter.setup({
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
                "python",
                "regex",
                "ruby",
                "rust",
                "svelte",
                "typescript",
                "tsx",
                "vim",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = false },
        })

        vim.g.skip_ts_context_commentstring_module = true -- skip backwards compatibility routines and speed up loading.
    end,
}
