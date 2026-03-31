-- =========================
-- 📑 Bufferline
-- =========================

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		opts = {
			options = {
				diagnostics = "nvim_lsp", -- show LSP errors in tabs
				show_buffer_close_icons = false, -- cleaner look
				show_close_icon = false,
				separator_style = "thin",
				offsets = {
					{
						filetype = "oil",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		keys = {
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Close buffer" },
		},
	},
}
