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
				indicator = { style = "none" },
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = { "", "" },
				offsets = {
					{
						filetype = "oil",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
			highlights = {
				buffer_selected = {
					fg = "#e0def4",
					bold = true,
					italic = false,
				},
				background = {
					fg = "#6c6882",
				},
				buffer_visible = {
					fg = "#6c6882",
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)

			-- Cmd+number to jump to buffer (via Ghostty ESC sequences)
			for i = 1, 9 do
				vim.keymap.set({ "n", "i", "v" }, "<M-" .. i .. ">", function()
					require("bufferline").go_to(i, true)
				end, { desc = "Go to buffer " .. i })
			end

			-- Cmd+W to close buffer
			vim.keymap.set({ "n", "i", "v" }, "<M-w>", "<cmd>bd<cr>", { desc = "Close buffer" })

			-- Track closed buffers for reopen
			local closed_buffers = {}

			vim.api.nvim_create_autocmd("BufDelete", {
				callback = function(ev)
					local name = vim.api.nvim_buf_get_name(ev.buf)
					if name ~= "" then
						table.insert(closed_buffers, name)
					end
				end,
			})

			-- Cmd+Shift+T to reopen last closed buffer
			vim.keymap.set({ "n", "i", "v" }, "<M-T>", function()
				if #closed_buffers == 0 then
					vim.notify("No recently closed buffers", vim.log.levels.INFO)
					return
				end
				local last = table.remove(closed_buffers)
				vim.cmd("edit " .. vim.fn.fnameescape(last))
			end, { desc = "Reopen last closed buffer" })
		end,
	},
}
