return {
    ---@type LazySpec
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",

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

        local nonicons = require("nvim-nonicons")
        local colors = require("nord.colors").palette
        local icons_kind = {
            Array = nonicons.get("brackets"),
            Boolean = nonicons.get("boolean"),
            Object = nonicons.get("class"),
            Folder = nonicons.get("file-directory"),
            Null = nonicons.get("circle-slash"),
            Namespace = nonicons.get("namespace"),
            Key = nonicons.get("key"),
            Package = nonicons.get("package"),
            Number = nonicons.get("number"),
            Text = nonicons.get("typography"),
            Method = nonicons.get("method"),
            Function = nonicons.get("function"),
            Constructor = nonicons.get("constructor"),
            Field = nonicons.get("field"),
            Variable = nonicons.get("variable"),
            Class = nonicons.get("class"),
            Interface = nonicons.get("interface"),
            Module = nonicons.get("package"),
            Property = nonicons.get("field"),
            Unit = nonicons.get("dot"),
            Value = nonicons.get("number"),
            Enum = nonicons.get("list-ordered"),
            Keyword = nonicons.get("keyword"),
            Snippet = nonicons.get("snippet"),
            Color = nonicons.get("paintbrush"),
            File = nonicons.get("file"),
            Reference = nonicons.get("mention"),
            EnumMember = nonicons.get("list-unordered"),
            Constant = nonicons.get("constant"),
            Struct = nonicons.get("struct"),
            Event = nonicons.get("broadcast"),
            Operator = nonicons.get("plus"),
            TypeParameter = nonicons.get("type"),
        }

        -- Tabnine config
        tabnine:setup({
            sort = true,
            max_lines = 1000,
            max_num_results = 10,
            snippet_placeholder = "" .. nonicons.get("kebab-horizontal") .. " ",
            run_on_every_keystroke = true,
            show_prediction_strength = false,
        })

        -- Cmp config
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window if visible.
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),

                ["<C-Space>"] = cmp.mapping.complete(), -- Invoke completion.

                ["<C-l>"] = cmp.mapping.confirm({ select = true }),
                ["<C-h>"] = cmp.mapping.abort(),
            }),
            completion = {
                keyword_length = 3,
            },
            sources = {
                { name = "cmp_tabnine", group_index = 1 },
                { name = "nvim_lsp", group_index = 1 },
                { name = "buffer", group_index = 2 },
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Set symbols
                    vim_item.kind = icons_kind[vim_item.kind] or ""

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

                        vim_item.kind = nonicons.get("zap")

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
            performance = { max_view_entries = 20 },
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
