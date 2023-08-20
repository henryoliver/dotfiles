local spec = {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonInstallAll",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",
  },
  build = ":MasonUpdate",
}

function spec:config()
    local mason = require("mason")
    local icons = require("config.icons")

  mason.setup({
    ui = {
      icons = {
        package_installed = icons.layout.installed,
        package_pending = icons.layout.pending,
        package_uninstalled = icons.layout.uninstalled,
      },
    },
  })
end

return spec
