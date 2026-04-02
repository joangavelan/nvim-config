-- =========================
-- 🎨 Colorscheme
-- =========================

return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	config = function()
		require("rose-pine").setup({
			variant = "auto",
			dark_variant = "main",
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
