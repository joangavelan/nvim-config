-- =========================
-- 🧠 LSP
-- =========================

return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ts_ls",           -- TypeScript / JavaScript
        "cssls",           -- CSS
        "tailwindcss",     -- Tailwind
        "sqlls",           -- SQL
        "lua_ls",          -- Lua
      },
    },
  },
}
