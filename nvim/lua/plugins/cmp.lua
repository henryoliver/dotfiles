return {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
        "yamatsum/nvim-nonicons",
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
    },
    config = function()
        local blink = require("blink.cmp")
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

        blink.setup({
            keymap = {
                preset = "none",
                ["<C-n>"] = { "select_next", "show", "fallback" },
                ["<C-p>"] = { "select_prev", "show", "fallback" },
                ["<C-j>"] = { "scroll_documentation_down", "fallback" },
                ["<C-k>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<C-l>"] = { "accept", "fallback" },
                ["<Tab>"] = { "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
            },

            completion = {
                keyword = { range = "full" },
                list = {
                    selection = { preselect = true, auto_insert = true },
                    max_items = 15,
                },
                menu = {
                    border = "rounded",
                    scrollbar = false,
                    winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                    draw = {
                        columns = {
                            { "kind_icon" },
                            { "label", "label_description", gap = 1 },
                            { "source_name" },
                        },
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    return (icons_kind[ctx.kind] or ctx.kind_icon) .. " "
                                end,
                            },
                            label = {
                                width = { fill = true, max = 50 },
                            },
                            source_name = {
                                width = { max = 15 },
                                text = function(ctx)
                                    return "[" .. ctx.source_name .. "]"
                                end,
                            },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                    window = {
                        border = "rounded",
                        max_width = 60,
                        max_height = 15,
                        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
                ghost_text = {
                    enabled = true,
                },
            },

            signature = { enabled = false },

            sources = {
                default = { "lsp", "snippets", "buffer", "path", "emoji" },
                providers = {
                    lsp = {
                        name = "LSP",
                        score_offset = 0,
                        fallbacks = {},
                    },
                    snippets = {
                        name = "Snip",
                        score_offset = -1,
                    },
                    buffer = {
                        name = "Buf",
                        min_keyword_length = 3,
                        score_offset = -3,
                    },
                    path = {
                        name = "Path",
                        score_offset = -2,
                    },
                    emoji = {
                        module = "blink-emoji",
                        name = "Emoji",
                        score_offset = -5,
                        min_keyword_length = 2,
                    },
                },
            },

            cmdline = {
                enabled = true,
                completion = {
                    menu = {
                        auto_show = function(ctx)
                            return vim.fn.getcmdtype() == ":"
                        end,
                    },
                },
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning",
                sorts = { "score", "sort_text", "label" },
            },
        })

        -- Highlights
        vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.polar_night.origin, fg = colors.snow_storm.origin })
        vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.polar_night.bright, fg = colors.snow_storm.origin })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = colors.polar_night.bright })

        vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.polar_night.bright, fg = colors.snow_storm.origin })
        vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.frost.artic_water, bold = true })
        vim.api.nvim_set_hl(0, "BlinkCmpLabelDeprecated", { fg = colors.polar_night.brightest, strikethrough = true })
        vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = colors.polar_night.brightest })
        vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.frost.artic_water })
    end,
}
