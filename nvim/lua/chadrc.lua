-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.mason = {
  pkgs = {
    "typescript-language-server",
    "eslint-lsp",
    "tailwindcss-language-server",
    "prettier",
    "css-lsp",
    "html-lsp",
  },
}

M.ui = {
  cmp = {
    style = "rosepine",
  },
  statusline = {
    separator_style = "arrow",
  },
}

M.nvdash = {
  load_on_startup = true,
}

return M
