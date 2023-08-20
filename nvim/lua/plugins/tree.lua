local spec = {
	"nvim-tree/nvim-tree.lua",
    lazy = false,
}

function spec:config()
	local nvimtree = require("nvim-tree")
    local nvimtree_api = require("nvim-tree.api")
    local colors = require("nord.colors")
    local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

	nvimtree.setup({
		filters = {
			dotfiles = false,
			custom = { "^\\.git$" },
		},
		disable_netrw = true,
		hijack_netrw = true,
		prefer_startup_root = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = false,
		hijack_directories = {
			enable = true,
			auto_open = false,
		},
		update_focused_file = {
			enable = true,
			update_cwd = false,
		},
		view = {
			adaptive_size = false,
			side = "left",
			width = 30,
			hide_root_folder = false,
		},
		git = {
			enable = true,
			ignore = false,
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = true,
			},
			change_dir = {
				enable = false,
				global = false,
				restrict_above_cwd = true,
			},
		},
		renderer = {
			highlight_git = false,
			highlight_opened_files = "none",

			root_folder_label = function(path)
				local project = vim.fn.fnamemodify(path, ":t")
				return string.upper(project)
			end,

			indent_markers = {
				enable = true,
			},

			icons = {
				webdev_colors = true,
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
                glyphs = nonicons_extention.glyphs,
			},
		},
	})

    -- Opening nvim-tree At Neovim Startup
    local function open_nvim_tree(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      -- create a new, empty buffer
      vim.cmd.enew()

      -- wipe the directory buffer
      vim.cmd.bw(data.buf)

      -- change to the directory
      vim.cmd.cd(data.file)

      -- open the tree
      nvimtree_api.tree.open()
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    -- Mappings
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = "NvimTree", silent = true })
end

return spec
