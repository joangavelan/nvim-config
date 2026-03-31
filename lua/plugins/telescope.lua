-- =========================
-- 🔭 Telescope (fuzzy finder)
-- =========================

return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
						".git",
						"deps",
						"_build",
					},
					mappings = {
						i = {
							["<Esc>"] = require("telescope.actions").close,
							["<C-u>"] = false,
						},
					},
				},
				extensions = {
					fzf = {},
				},
			})

			telescope.load_extension("fzf")

			local map = vim.keymap.set

			map("n", "<C-p>", builtin.find_files, { desc = "Find files" })
			map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
			map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
		end,
	},
}
