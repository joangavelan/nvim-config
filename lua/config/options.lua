-- =========================
-- ⚙️  Options
-- =========================

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- spaces instead of tabs
opt.smartindent = true -- auto indent on new lines

-- Search
opt.ignorecase = true -- case insensitive by default
opt.smartcase = true -- case sensitive if you type uppercase
opt.hlsearch = true -- highlight results
opt.incsearch = true -- highlight as you type

-- UI
opt.termguicolors = true -- full color support
opt.signcolumn = "yes" -- always show sign column (prevents layout shifts with LSP)
opt.cursorline = true -- highlight current line
opt.scrolloff = 8 -- keep context lines above and below cursor
opt.wrap = false -- no line wrapping
opt.laststatus = 0 -- hide statusline
opt.ruler = false -- hide ruler

-- Splits
opt.splitright = true -- vertical splits open right
opt.splitbelow = true -- horizontal splits open below

-- Clipboard
opt.clipboard = "unnamedplus"

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true -- persistent undo across sessions

-- Performance
opt.updatetime = 250 -- faster LSP response
opt.timeoutlen = 300 -- faster which-key response

-- Inline diagnostics
vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
		spacing = 4,
	},
	signs = true,
	underline = true,
	update_in_insert = false, -- only show after leaving insert mode
	severity_sort = true,
})
