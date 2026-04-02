-- =========================
-- 🎨 Colorscheme
-- =========================

return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false, -- load at startup so colorscheme is available immediately
	priority = 1000, -- load before other plugins
	config = function()
		require("rose-pine").setup({
			variant = "auto", -- auto, main, moon, or dawn
			dark_variant = "main", -- which variant to use when dark
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		})
		vim.cmd("colorscheme rose-pine")
	end,
}
