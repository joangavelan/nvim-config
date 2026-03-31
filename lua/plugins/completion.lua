-- =========================
-- ✨ Autocompletion
-- =========================

return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets", -- common snippets for many languages
		},
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				documentation = {
					auto_show = true, -- show docs popup automatically
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = true, -- show inline preview of first suggestion
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}
