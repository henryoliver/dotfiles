return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "yamatsum/nvim-nonicons",

        -- AI completion
        { "tzachar/cmp-tabnine", build = "./install.sh" },

        -- LSP
        "hrsh7th/cmp-nvim-lsp",

        -- Snippets
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",

        -- Buffer and path
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        -- Additional sources
        "hrsh7th/cmp-emoji", -- Emoji completion
    },
    config = function()
        local cmp = require("cmp")
        local compare = require("cmp.config.compare")

        local tabnine = require("cmp_tabnine.config")
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
            -- Fallback to nonicons if available
            TabNine = nonicons.get("zap"),
            Copilot = nonicons.get("zap"),
            AI = nonicons.get("zap"),
        }

        -- Tabnine config
        tabnine:setup({
            sort = true,
            max_lines = 1000,
            max_num_results = 3, -- Reduced for better performance
            snippet_placeholder = "" .. nonicons.get("kebab-horizontal") .. " ",
            run_on_every_keystroke = true,
            show_prediction_strength = true,
            ignored_file_types = {
                TelescopePrompt = true,
                NvimTree = true,
                neo_tree = true,
                oil = true,
                trouble = true,
                lazy = true,
                mason = true,
            },
        })

        -- Cmp config
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- Navigation
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

                -- Scrolling
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(8),
                ["<C-u>"] = cmp.mapping.scroll_docs(-8),

                -- Completion control
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),

                -- Confirmation
                ["<C-l>"] = cmp.mapping.confirm({ select = true }),
            }),
            completion = {
                keyword_length = 2, -- Reduced from 3 for better responsiveness
                keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
                completeopt = "menu,menuone,noselect",
            },
            sources = cmp.config.sources({
                -- High priority sources
                { name = "cmp_tabnine", group_index = 1, priority = 1100, max_item_count = 3 },
                { name = "nvim_lsp", group_index = 1, priority = 1000 },
                { name = "vsnip", group_index = 1, priority = 900 },

                -- Medium priority sources
                {
                    name = "buffer",
                    group_index = 2,
                    priority = 500,
                    keyword_length = 3,
                    option = {
                        get_bufnrs = function()
                            -- Complete from all visible buffers
                            local bufs = {}
                            for _, win in ipairs(vim.api.nvim_list_wins()) do
                                bufs[vim.api.nvim_win_get_buf(win)] = true
                            end
                            return vim.tbl_keys(bufs)
                        end,
                    },
                },
                { name = "path", group_index = 2, priority = 400 },
                { name = "emoji", group_index = 2, priority = 300, keyword_length = 2 },

                -- Lower priority sources
                { name = "calc", group_index = 3, priority = 200 },
            }),
            per_filetype = {
                codecompanion = { "codecompanion" },
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
                        vsnip = "[Snip]",
                        buffer = "[Buf]",
                        cmdline = "[Cmd]",
                        path = "[Path]",
                        emoji = "[Emoji]",
                    })[entry.source.name]

                    -- AI custom symbol and type
                    if entry.source.name == "cmp_tabnine" then
                        local detail = (entry.completion_item.labelDetails or {}).detail

                        vim_item.kind = icons_kind["TabNine"]

                        if detail and detail:find(".*%%.*") then
                            vim_item.kind = vim_item.kind .. " " .. detail
                        end

                        if (entry.completion_item.data or {}).multiline then
                            vim_item.menu = "[AI - ML]"
                        end
                    end

                    -- Truncate long completions
                    local max_width = 50
                    local max_menu_width = 15

                    if vim_item.abbr and string.len(vim_item.abbr) > max_width then
                        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
                    end

                    if vim_item.menu and string.len(vim_item.menu) > max_menu_width then
                        vim_item.menu = string.sub(vim_item.menu, 1, max_menu_width - 1) .. "…"
                    end

                    return vim_item
                end,
            },
            window = {
                completion = {
                    border = "rounded",
                    scrolloff = 2,
                    col_offset = -3,
                    side_padding = 1,
                    scrollbar = false,
                    winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    border = "rounded",
                    max_height = 15,
                    max_width = 60,
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
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
                    compare.locality,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            experimental = {
                ghost_text = true,
            },
            performance = {
                debounce = 100, -- Slightly increased for better performance
                throttle = 50,
                fetching_timeout = 500,
                confirm_resolve_timeout = 80,
                async_budget = 1,
                max_view_entries = 15, -- Reduced for better performance
            },
            matching = {
                disallow_fuzzy_matching = false,
                disallow_partial_matching = false,
                disallow_prefix_unmatching = false,
            },
        })

        -- Command line completion
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer", keyword_length = 3 },
            },
            formatting = {
                fields = { "abbr" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline({
                ["<C-n>"] = { c = cmp.mapping.select_next_item() },
                ["<C-p>"] = { c = cmp.mapping.select_prev_item() },
            }),
            sources = cmp.config.sources({
                { name = "cmdline", keyword_length = 2 },
            }, {
                { name = "path" },
            }),
            formatting = {
                fields = { "abbr" },
            },
        })

        -- Highlights

        -- TabNine specific
        vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = colors.frost.artic_water })

        -- Completion menu highlights
        vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.polar_night.origin, fg = colors.snow_storm.origin })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.polar_night.bright, fg = colors.snow_storm.origin })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = colors.polar_night.bright })

        -- Cmp specific highlights
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.frost.artic_water, bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.frost.artic_water, bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = colors.polar_night.brightest, strikethrough = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = colors.polar_night.brightest })

        -- Selection highlights
        vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.snow_storm.origin })
        vim.api.nvim_set_hl(0, "CmpItemAbbrSelected", { fg = colors.snow_storm.origin, bg = colors.polar_night.bright })
        vim.api.nvim_set_hl(0, "CmpItemKind", { fg = colors.frost.artic_water })
        vim.api.nvim_set_hl(0, "CmpItemKindSelected", { fg = colors.frost.artic_water, bg = colors.polar_night.bright })
    end,
}
