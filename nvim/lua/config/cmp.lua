-- Load mappings from the centralized file
local cmp_mappings = require("config.keybinds").cmp

dofile(vim.g.base46_cache .. "cmp")

local cmp = require "cmp"


local options = {
  completion = { completeopt = "menu,menuone" },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  -- Use the imported mappings
  mapping = cmp_mappings(cmp),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
