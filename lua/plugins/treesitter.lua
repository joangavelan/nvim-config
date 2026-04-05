-- =========================
-- 🌳 Treesitter
-- =========================

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	main = "nvim-treesitter",
	init = function()
		-- Enable highlighting and indentation for all filetypes
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- Install parsers
		local ensureInstalled = {
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
		}

		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local toInstall = vim.iter(ensureInstalled)
			:filter(function(p)
				return not vim.tbl_contains(alreadyInstalled, p)
			end)
			:totable()
		require("nvim-treesitter").install(toInstall)
	end,
}
