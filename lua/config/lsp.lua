-- =========================
-- 🧠 LSP keymaps & config
-- =========================

-- keymaps when LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = vim.keymap.set
    local opts = { buffer = args.buf, silent = true }

    -- navigation
    map("n", "gd", vim.lsp.buf.definition,      vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    map("n", "gD", vim.lsp.buf.declaration,     vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    map("n", "gr", vim.lsp.buf.references,      vim.tbl_extend("force", opts, { desc = "Find references" }))
    map("n", "gi", vim.lsp.buf.implementation,  vim.tbl_extend("force", opts, { desc = "Go to implementation" }))

    -- docs & info
    map("n", "<leader>h", vim.lsp.buf.hover,        vim.tbl_extend("force", opts, { desc = "Hover docs" }))
    map("n", "<leader>sh", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

    -- code actions
    map("n", "<leader>rn", vim.lsp.buf.rename,       vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
    map("n", "<leader>ca", vim.lsp.buf.code_action,  vim.tbl_extend("force", opts, { desc = "Code actions" }))

    -- diagnostics
    map("n", "<leader>d",  vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic" }))
    map("n", "[d",         vim.diagnostic.goto_prev,  vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
    map("n", "]d",         vim.diagnostic.goto_next,  vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
  end,
})

-- lua_ls: recognize vim global so it stops warning in nvim config files
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- enable all servers
vim.lsp.enable({
  "ts_ls",
  "cssls",
  "tailwindcss",
  "sqlls",
  "lua_ls",
})
