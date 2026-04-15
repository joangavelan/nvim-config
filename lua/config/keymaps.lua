-- =========================
-- ⌨️  Keymaps
-- =========================

local map = vim.keymap.set

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =========================
-- 🧭 Navigation
-- =========================

-- word jump
map("n", "q", "b", { noremap = true, silent = true, desc = "Jump word back" })
map("n", "W", "$", { noremap = true, silent = true, desc = "End of line" })
map("n", "Q", "0", { noremap = true, silent = true, desc = "Start of line" })

-- jump 15 lines at a time
map("n", "J", "15j", { noremap = true, silent = true, desc = "Jump 15 lines down" })
map("n", "K", "15k", { noremap = true, silent = true, desc = "Jump 15 lines up" })

-- =========================
-- ✏️  Editing
-- =========================

-- undo and redo
map("n", "'", "u", { noremap = true, silent = true, desc = "Undo" })
map("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })

-- move selected lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- indentation
map("n", "<Tab>", ">>", { noremap = true, desc = "Indent line" })
map("n", "<S-Tab>", "<<", { noremap = true, desc = "Unindent line" })
map("v", "<Tab>", ">gv", { noremap = true, desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { noremap = true, desc = "Unindent selection" })

-- search and replace
map("n", "<leader>sr", ":%s///g<left><left><left>", { desc = "Search and replace" })

-- =========================
-- 💾 File
-- =========================

-- save
map("n", "<C-s>", ":update<CR>", { noremap = true, silent = true, desc = "Save file" })
map("i", "<C-s>", "<Esc>:update<CR>", { noremap = true, silent = true, desc = "Save file from insert mode" })

-- =========================
-- ⚙️  Config
-- =========================

-- open keymaps config
map("n", "<leader>gnc", "<cmd>e ~/.config/nvim/lua/config/keymaps.lua<cr>", { desc = "Open keymaps config" })
