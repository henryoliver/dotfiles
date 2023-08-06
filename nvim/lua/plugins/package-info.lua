local nord = require("nord.colors")

return {
    -- Package Info
    {
        "vuki656/package-info.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        ft = "json",
        opts = {
            colors = {
                up_to_date = nord.nord3_gui, -- Text color for up to date dependency virtual text
                outdated = nord.nord1_gui,   -- Text color for outdated dependency virtual text
            },
            autostart = true,                -- Whether to autostart when `package.json` is opened
            package_manager = "npm",
        },
    },
}
