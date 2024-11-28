vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

require("config.lazy")
require("config.options")
require("config.autocmds")

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

local mappings = require("config.keybinds")

-- Helper function to set mappings
local function set_mappings(mode, keymaps)
  for key, map in pairs(keymaps) do
    vim.keymap.set(
      mode, 
      key, 
      map[1], 
      { desc = map[2], remap = map.remap or false, silent = true, noremap = true }
    )
  end
end

-- cmp mappings are set in the config for the plugin...

-- General mappings
for mode, keymaps in pairs(mappings.general) do
  set_mappings(mode, keymaps)
end

-- Bufferline mappings
for mode, keymaps in pairs(mappings.bufferline) do
  set_mappings(mode, keymaps)
end

-- Comment plugin mappings
for mode, keymaps in pairs(mappings.comment) do
  set_mappings(mode, keymaps)
end

-- NvimTree mappings
for mode, keymaps in pairs(mappings.nvimtree) do
  set_mappings(mode, keymaps)
end

-- Telescope mappings

for mode, keymaps in pairs(mappings.telescope) do
  set_mappings(mode, keymaps)
end

-- Terminal mappings
for mode, keymaps in pairs(mappings.terminal) do
  set_mappings(mode, keymaps)
end

-- WhichKey mappings
for mode, keymaps in pairs(mappings.whichkey) do
  set_mappings(mode, keymaps)
end
