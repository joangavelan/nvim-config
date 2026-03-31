-- =========================
-- 💡 Which-key
-- =========================

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "classic",
			delay = 400, -- ms before popup appears
			icons = {
				mappings = false, -- disable icons if no nerd font
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			-- group labels so the popup is organized
			wk.add({
				{ "<leader>f", group = "find" },
				{ "<leader>g", group = "git" },
				{ "<leader>c", group = "code" },
				{ "<leader>s", group = "search" },
				{ "<leader>h", group = "help" },
			})
		end,
	},
}
