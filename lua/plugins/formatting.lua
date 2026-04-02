-- =========================
-- 🎨 Formatting
-- =========================

return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettierd" },
					typescript = { "prettierd" },
					javascriptreact = { "prettierd" },
					typescriptreact = { "prettierd" },
					css = { "prettierd" },
					html = { "prettierd" },
					json = { "prettierd" },
					markdown = { "prettierd" },
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 2000,
					lsp_format = "fallback",
				},
			})

			-- manual format keymap
			vim.keymap.set({ "n", "v" }, "<leader>cf", function()
				conform.format({ timeout_ms = 2000, lsp_format = "fallback" })
			end, { desc = "Format file" })
		end,
	},
}
