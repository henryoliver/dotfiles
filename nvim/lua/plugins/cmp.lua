return {
    -- Nvim CMP
    -- A completion engine plugin for neovim written in Lua. Completion sources are installed from external repositories and "sourced".
    "hrsh7th/nvim-cmp",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/cmp-nvim-lsp",

        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",

        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")

        local compare = require("cmp.config.compare")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        local icons = require("config.icons")

        -- Cmp config
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<c-n>"] = cmp.mapping.select_next_item(),
                ["<c-p>"] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window if visible.
                ["<c-j>"] = cmp.mapping.scroll_docs(4),
                ["<c-k>"] = cmp.mapping.scroll_docs(-4),

                ["<c-space>"] = cmp.mapping.complete(), -- Invoke completion.

                ["<c-l>"] = cmp.mapping.confirm({ select = true }),
                ["<c-h>"] = cmp.mapping.abort(),
            }),
            completion = {
                keyword_length = 3,
            },
            sources = {
                { name = "nvim_lsp", group_index = 1 },
                { name = "buffer", group_index = 2 },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Set symbols
                    vim_item.kind = icons.kind[vim_item.kind] or ""

                    -- Set source name
                    vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        cmdline = "[CMD]",
                        path = "[Path]",
                    })[entry.source.name]

                    local maxwidth = 80
                    vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

                    return vim_item
                end,
            },
            window = {
                completion = {
                    border = "rounded",
                    scrolloff = vim.go.scrolloff,
                    winhighlight = "Normal:None,FloatBorder:None,Search:None",
                },
                documentation = {
                    border = "rounded",
                    winhighlight = "Normal:None,FloatBorder:None,Search:None",
                },
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    compare.offset,
                    compare.exact,
                    compare.score,
                    compare.recently_used,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            experimental = {
                ghost_text = true,
            },
            performance = { max_view_entries = 10 },
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "cmdline" },
                { name = "buffer" },
            }, {
                { name = "path" },
            }),
        })
    end,
}
