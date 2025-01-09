local options = {
  formatters_by_ft = {
    lua = { "stylua " },
    javascript = { "eslint" },
    typescript = { "eslint" },
    html = { "prettier" },
    css = { "prettier" },
    svelte = { "prettier" },
    javascriptreact = { "eslint" },
    typescriptreact = { "eslint" },
    json = { "prettier" },
    python = { "prettier" },
    graphql = { "prettier" },
    yaml = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 4000,
    lsp_fallback = true,
  },
}

return options
