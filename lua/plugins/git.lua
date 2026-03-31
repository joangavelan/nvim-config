-- =========================
-- 🌿 Git
-- =========================

return {
	-- inline diff signs in the gutter
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "▸" },
					topdelete = { text = "▸" },
					changedelete = { text = "▎" },
					untracked = { text = "▎" },
				},
				current_line_blame = false, -- toggle with :Gitsigns toggle_current_line_blame
			})

			local map = vim.keymap.set

			-- navigate hunks
			map("n", "]h", gitsigns.next_hunk, { desc = "Next hunk" })
			map("n", "[h", gitsigns.prev_hunk, { desc = "Prev hunk" })

			-- stage / reset
			map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
			map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
			map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
			map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

			-- preview
			map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })

			-- blame
			map("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame line" })
		end,
	},

	-- lazygit inside neovim
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
