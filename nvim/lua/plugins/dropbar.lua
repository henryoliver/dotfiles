return {
    ---@type LazySpec
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    dependencies = "yamatsum/nvim-nonicons",
    config = function()
        local dropbar = require("dropbar")
        local nonicons = require("nvim-nonicons")
        local icons_symbols = {
            Array = "" .. nonicons.get("brackets") .. " ",
            Boolean = "" .. nonicons.get("boolean") .. " ",
            BreakStatement = "" .. nonicons.get("x") .. " ",
            Call = "" .. nonicons.get("megaphone") .. " ",
            CaseStatement = "" .. nonicons.get("list-ordered") .. " ",
            Class = "" .. nonicons.get("class") .. " ",
            Color = "" .. nonicons.get("paintbrush") .. " ",
            Constant = "" .. nonicons.get("constant") .. " ",
            Constructor = "" .. nonicons.get("tools") .. " ",
            ContinueStatement = "" .. nonicons.get("arrow-right") .. " ",
            Copilot = "" .. nonicons.get("hubot") .. " ",
            Declaration = "" .. nonicons.get("note") .. " ",
            Delete = "" .. nonicons.get("trash") .. " ",
            DoStatement = "" .. nonicons.get("play") .. " ",
            Enum = "" .. nonicons.get("list-ordered") .. " ",
            EnumMember = "" .. nonicons.get("list-unordered") .. " ",
            Event = "" .. nonicons.get("broadcast") .. " ",
            Field = "" .. nonicons.get("field") .. " ",
            File = "" .. nonicons.get("file") .. " ",
            Folder = "" .. nonicons.get("file-directory") .. " ",
            ForStatement = "" .. nonicons.get("sync") .. " ",
            Function = "" .. nonicons.get("code") .. " ",
            H1Marker = "" .. nonicons.get("heading") .. " ",
            H2Marker = "" .. nonicons.get("heading") .. " ",
            H3Marker = "" .. nonicons.get("heading") .. " ",
            H4Marker = "" .. nonicons.get("heading") .. " ",
            H5Marker = "" .. nonicons.get("heading") .. " ",
            H6Marker = "" .. nonicons.get("heading") .. " ",
            Identifier = "" .. nonicons.get("tag") .. " ",
            IfStatement = "" .. nonicons.get("git-branch") .. " ",
            Interface = "" .. nonicons.get("interface") .. " ",
            Keyword = "" .. nonicons.get("keyword") .. " ",
            List = "" .. nonicons.get("list-unordered") .. " ",
            Log = "" .. nonicons.get("note") .. " ",
            Lsp = "" .. nonicons.get("code-square") .. " ",
            Macro = "" .. nonicons.get("terminal") .. " ",
            MarkdownH1 = "" .. nonicons.get("heading") .. " ",
            MarkdownH2 = "" .. nonicons.get("heading") .. " ",
            MarkdownH3 = "" .. nonicons.get("heading") .. " ",
            MarkdownH4 = "" .. nonicons.get("heading") .. " ",
            MarkdownH5 = "" .. nonicons.get("heading") .. " ",
            MarkdownH6 = "" .. nonicons.get("heading") .. " ",
            Method = "" .. nonicons.get("code") .. " ",
            Module = "" .. nonicons.get("package") .. " ",
            Namespace = "" .. nonicons.get("repo") .. " ",
            Null = "" .. nonicons.get("circle-slash") .. " ",
            Number = "" .. nonicons.get("number") .. " ",
            Object = "" .. nonicons.get("package") .. " ",
            Operator = "" .. nonicons.get("plus") .. " ",
            Package = "" .. nonicons.get("package") .. " ",
            Pair = "" .. nonicons.get("git-pull-request") .. " ",
            Property = "" .. nonicons.get("field") .. " ",
            Reference = "" .. nonicons.get("mention") .. " ",
            Regex = "" .. nonicons.get("search") .. " ",
            Repeat = "" .. nonicons.get("sync") .. " ",
            Scope = "" .. nonicons.get("repo") .. " ",
            Snippet = "" .. nonicons.get("snippet") .. " ",
            Specifier = "" .. nonicons.get("gear") .. " ",
            Statement = "" .. nonicons.get("terminal") .. " ",
            String = "" .. nonicons.get("quote") .. " ",
            Struct = "" .. nonicons.get("struct") .. " ",
            SwitchStatement = "" .. nonicons.get("git-branch") .. " ",
            Table = "" .. nonicons.get("table") .. " ",
            Terminal = "" .. nonicons.get("terminal") .. " ",
            Text = "" .. nonicons.get("note") .. " ",
            Type = "" .. nonicons.get("type") .. " ",
            TypeParameter = "" .. nonicons.get("type") .. " ",
            Unit = "" .. nonicons.get("dot") .. " ",
            Value = "" .. nonicons.get("number") .. " ",
            Variable = "" .. nonicons.get("variable") .. " ",
            WhileStatement = "" .. nonicons.get("sync") .. " ",
        }

        dropbar.setup({
            icons = {
                enable = true,
                kinds = {
                    dir_icon = "" .. nonicons.get("file-directory") .. " ",
                    file_icon = "" .. nonicons.get("file") .. " ",
                    symbols = icons_symbols,
                },
                ui = {
                    bar = {
                        separator = " " .. nonicons.get("chevron-right") .. "  ",
                        extends = nonicons.get("kebab-horizontal"),
                    },
                    menu = {
                        separator = " ",
                        indicator = nonicons.get("chevron-right"),
                    },
                },
            },
        })
    end,
    keys = {
        {
            "<Leader>;",
            function()
                return require("dropbar.api").pick()
            end,
            mode = "n",
            desc = "Pick symbols in winbar",
        },
        {
            "[;",
            function()
                return require("dropbar.api").goto_context_start()
            end,
            mode = "n",
            desc = "Go to start of current context",
        },
        {
            "];",
            function()
                return require("dropbar.api").select_next_context()
            end,
            mode = "n",
            desc = "Select next context",
        },
    },
}
