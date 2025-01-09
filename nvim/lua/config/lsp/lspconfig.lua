local M = {}

local lsp_mappings = require("config.keybinds").lsp
local servers = {
  "html",
  "eslint",
  "tailwindcss",
  "lua_ls",
  "ts_ls",
  "pyright",
  "graphql",
  "yamlls"
}

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  local function set_keymap(mode, key, cmd, desc)
    local opts = { noremap = true, silent = true, buffer = bufnr, desc = "LSP " .. desc }
    vim.keymap.set(mode, key, cmd, opts)
  end

  for mode, mappings in pairs(lsp_mappings) do
    if mode == "n_v" then
      for key, map in pairs(mappings) do
        set_keymap("n", key, map[1], map[2])
        set_keymap("v", key, map[1], map[2])
      end
    else
      for key, map in pairs(mappings) do
        set_keymap(mode, key, map[1], map[2])
      end
    end
  end
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()

  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      on_init = M.on_init,
    })
  end

  require("lspconfig").lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

return M
