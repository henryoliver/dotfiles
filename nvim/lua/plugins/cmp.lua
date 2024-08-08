return {
    -- Nvim CMP
    "hrsh7th/nvim-cmp",
    dependencies = {
        "nvim-lua/plenary.nvim",

        { "tzachar/cmp-tabnine", build = "./install.sh" },
        "hrsh7th/cmp-nvim-lsp",

        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",

        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")
        local tabnine = require("cmp_tabnine.config")

        local compare = require("cmp.config.compare")
        local tabnine_compare = require("cmp_tabnine.compare")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        local icons = require("config.icons")
        local colors = require("nord.colors").palette

        -- Tabnine config
        tabnine:setup({
            sort = true,
            max_lines = 1000,
            max_num_results = 10,
            snippet_placeholder = " ",
            run_on_every_keystroke = true,
            show_prediction_strength = false,
        })

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
                { name = "cmp_tabnine", group_index = 1 },
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
                        cmp_tabnine = "[AI]",
                        nvim_lsp = "[LSP]",
                        buffer = "[Buffer]",
                        cmdline = "[CMD]",
                        path = "[Path]",
                    })[entry.source.name]

                    -- AI custom symbol and type
                    if entry.source.name == "cmp_tabnine" then
                        local detail = (entry.completion_item.labelDetails or {}).detail

                        vim_item.kind = ""

                        if detail and detail:find(".*%%.*") then
                            vim_item.kind = vim_item.kind .. " " .. detail
                        end

                        if (entry.completion_item.data or {}).multiline then
                            vim_item.menu = "[AI - ML]"
                        end
                    end

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
                    tabnine_compare,
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

        -- Highlights
        vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = colors.frost.artic_water })
    end,
}
