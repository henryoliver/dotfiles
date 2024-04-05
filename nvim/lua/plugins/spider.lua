return {
    -- Nvim Spider
    -- Use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.
    {
        "chrisgrieser/nvim-spider",
        event = "VeryLazy",
        config = true,
        keys = {
            {
                "w",
                mode = { "n", "o", "x" },
                function()
                    require("spider").motion("w")
                end,
                desc = "Spider-w",
            },
            {
                "e",
                mode = { "n", "o", "x" },
                function()
                    require("spider").motion("e")
                end,
                desc = "Spider-e",
            },
            {
                "b",
                mode = { "n", "o", "x" },
                function()
                    require("spider").motion("b")
                end,
                desc = "Spider-b",
            },
        },
    },
}
