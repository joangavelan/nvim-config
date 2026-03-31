-- =========================
-- 📁 File explorer
-- =========================

return {
	{
		"stevearc/oil.nvim",
		lazy = false, -- load immediately, not lazily
		opts = {
			default_file_explorer = true, -- replace netrw
			view_options = {
				show_hidden = true, -- show dotfiles
			},
			float = {
				padding = 2,
				max_width = 80,
				max_height = 30,
			},
			keymaps = {
				["<C-p>"] = false, -- disable Oil's default C-p (preview split)
			},
		},
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open file explorer" },
		},
	},
}
