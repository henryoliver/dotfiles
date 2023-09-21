return {
    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        opts = {
            openai_params = {
                model = "gpt-4",
            },
            openai_edit_params = {
                model = "gpt-4",
            },
            popup_layout = {
                default = "right",
            },
        },
        init = function()
            -- Mappings
            local wk = require("which-key")
            local chatgpt = require("chatgpt")

            wk.register({
                i = {
                    name = "ChatGPT A[I]",
                    c = { chatgpt.openChat, "ChatGPT" },
                    l = { chatgpt.complete_code, "Complete code" },
                    e = { chatgpt.edit_with_instructions, "Edit with instruction" },
                    -- Actions
                    a = {
                        name = "Actions",
                        c = { function() chatgpt.run_action("complete_code") end, "Complete code" },
                        g = { function() chatgpt.run_action("grammar_correction") end, "Grammar correction" },
                        d = { function() chatgpt.run_action("docstring") end, "Docstring" },
                        t = { function() chatgpt.run_action("add_tests") end, "Add test" },
                        o = { function() chatgpt.run_action("optimize_code") end, "Optimize code" },
                        f = { function() chatgpt.run_action("fix_bugs") end, "Fix bugs" },
                        a = { function() chatgpt.run_action("code_readability_analysis") end, "Code readability analysis" }
                    }
                },
            }, { prefix = "<leader>", mode = { "n", "v" } })
        end,
    },
}
