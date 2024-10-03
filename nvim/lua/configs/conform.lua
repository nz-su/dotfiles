local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    svelte = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
  },
  -- enable format on save
  format_on_save = {
    timeout_ms = 4000,
    lsp_fallback = true,
  },
}

return options
