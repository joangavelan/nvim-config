-- =========================
-- 📁 File explorer
-- =========================

return {
	{
		"stevearc/oil.nvim",
		lazy = false, -- load immediately, not lazily
		opts = {
			default_file_explorer = true, -- replace netrw
			skip_confirm_for_simple_edits = true, -- no confirm for create/rename/move
			view_options = {
				show_hidden = true, -- show dotfiles
			},
			float = {
				padding = 2,
				max_width = 80,
				max_height = 30,
			},
			keymaps = {
				["<C-p>"] = false, -- prevent conflict with Telescope
				["<C-s>"] = false, -- prevent conflict with save keymap
			},
		},
		keys = {
			{ "|", "<cmd>Oil<cr>", desc = "Open file explorer" },
		},
	},
}
