local spec = {
	"nvim-telescope/telescope.nvim",
	build = "make",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-fzy-native.nvim",
	},
}

function spec:init()
    -- Mappings
    -- Words
    vim.keymap.set("n", "<leader>sw", ":Telescope live_grep<cr>", { desc = "Project Words" })
    vim.keymap.set("n", "<leader>sW", ":Telescope current_buffer_fuzzy_find<cr>", { desc = "Current Buffer Words" })
    -- Files
    vim.keymap.set("n", "<leader>sf", ":Telescope git_files<cr>", { desc = "Git Files" })
    vim.keymap.set("n", "<leader>sF", ":Telescope find_files<cr>", { desc = "Project Files" })
    -- Others
    vim.keymap.set("n", "<leader>su", ":Telescope undo<cr>", { desc = "Undo" })
    vim.keymap.set("n", "<leader>sm", ":Telescope marks<cr>", { desc = "Marks" })
    vim.keymap.set("n", "<leader>sb", ":Telescope buffers<cr>", { desc = "Buffers" })
    vim.keymap.set("n", "<leader>sr", ":Telescope registers<cr>", { desc = "Registers" })
    -- LSP
    vim.keymap.set("n", "<leader>sd", ":Telescope diagnostics<cr>", { desc = "LSP Diagnostics" })
    -- Git
    vim.keymap.set("n", "<leader>sg", ":Telescope git_bcommits<cr>", { desc = "Git Buffer Commits" })
    vim.keymap.set("v", "<leader>sg", ":Telescope git_bcommits_range<cr>", { desc = "Git Commits by Range" })
end

function spec:config()
    local icons = require("nvim-nonicons")
	local telescope = require("telescope")
	local themes = require("telescope.themes")

	telescope.setup({
		defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
			file_ignore_patterns = { "^%.git/", "^node_modules/", "package-lock.json" },
			path_display = { "truncate" },
            prompt_prefix = "  " .. icons.get("telescope") .. "  ",
            selection_caret = "  " .. icons.get("chevron-right") .. "  ",
            entry_prefix = "   ",
		}),
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				disable_coordinates = true,
			},
		},
        extensions = {
            undo = {
                -- telescope-undo.nvim config, see below
            },
            fzy_native = {
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
	})

    -- Plugins
    telescope.load_extension("undo")
    telescope.load_extension("fzy_native")
end

return spec
