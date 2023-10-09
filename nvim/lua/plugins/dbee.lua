return {
    -- Dbee
    {
        "kndndrj/nvim-dbee",
        lazy = true,
        keys = "<leader>d",
        dependencies = "MunifTanjim/nui.nvim",
        build = function()
            -- Install tries to automatically detect the install method.
            -- if it fails, try calling it with one of these parameters:
            --    "curl", "wget", "bitsadmin", "go"
            require("dbee").install()
        end,
        config = true,
        init = function()
            -- Mappings
            local wk = require("which-key")
            local dbee = require("dbee")

            wk.register({
                d = { dbee.toggle, "Dbee" },
            }, { prefix = "<leader>", mode = "n" })
        end,
    },
}
