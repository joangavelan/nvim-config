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
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			-- Custom actions
			local function replace_current_buffer(prompt_bufnr)
				local selected = action_state.get_selected_entry()
				local filepath = selected and (selected.path or selected.filename)
				actions.close(prompt_bufnr)
				if filepath then
					local cur_buf = vim.api.nvim_get_current_buf()
					vim.cmd("edit " .. vim.fn.fnameescape(filepath))
					vim.api.nvim_buf_delete(cur_buf, { force = false })
				end
			end

			local function open_folder_in_oil(prompt_bufnr)
				local selected = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				if selected then
					local path = selected.path or selected.filename
					local dir = vim.fn.isdirectory(path) == 1 and path or vim.fn.fnamemodify(path, ":h")
					require("oil").open(dir)
				end
			end

			local function find_folders()
				builtin.find_files({
					find_command = {
						"find",
						".",
						"-type",
						"d",
						"-not",
						"-path",
						"*/node_modules/*",
						"-not",
						"-path",
						"*/.git/*",
					},
					attach_mappings = function(_, map_)
						map_("i", "<CR>", open_folder_in_oil)
						return true
					end,
				})
			end

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
							["<Esc>"] = actions.close,
							["<C-u>"] = false,
							["<M-o>"] = replace_current_buffer,
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
			map("n", "<leader>ff", find_folders, { desc = "Find folders" })
			map("n", "<leader>fg", builtin.live_grep, { desc = "Find by grep" })
			map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			map("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
			map("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
		end,
	},
}
