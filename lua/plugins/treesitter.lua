-- =========================
-- 🌳 Treesitter
-- =========================

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").install({
				"lua",
				"elixir",
				"heex",
				"eex",
				"typescript",
				"tsx",
				"javascript",
				"css",
				"html",
				"json",
				"sql",
				"markdown",
				"bash",
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"lua",
					"elixir",
					"heex",
					"eex",
					"typescript",
					"typescriptreact",
					"javascript",
					"javascriptreact",
					"css",
					"html",
					"json",
					"sql",
					"markdown",
					"bash",
				},
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
