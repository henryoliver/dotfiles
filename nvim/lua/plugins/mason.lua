local nonicons_extention = require("nvim-nonicons.extentions.mason")

return {
    -- Mason
    "williamboman/mason.nvim",
    dependencies = "williamboman/mason-lspconfig.nvim",
    opts = {
        ui = {
            icons = nonicons_extention.icons,
        }
    },
    config = true
}
