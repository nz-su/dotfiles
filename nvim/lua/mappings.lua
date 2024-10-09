require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local harpoon = require "harpoon"
harpoon:setup {}

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Telescope Undo" })
map("n", "<leader>fh", function()
  toggle_telescope(harpoon:list())
end, { desc = "Harpoon open harpoon window" })

map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Harpoon add to Harpoon List" })
map("n", "<C-1>", function()
  harpoon:list():select(1)
end, { desc = "Harpoon toggle 1st buffer in Harpoon List" })
map("n", "<C-2>", function()
  harpoon:list():select(2)
end, { desc = "Harpoon toggle 2nd buffer in Harpoon List" })
map("n", "<C-3>", function()
  harpoon:list():select(3)
end, { desc = "Harpoon toggle 3rd buffer in Harpoon List" })
map("n", "<C-4>", function()
  harpoon:list():select(4)
end, { desc = "Harpoon toggle 4th buffer in Harpoon List" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
  harpoon:list():prev()
end, { desc = "Harpoon toggle previous buffer in Harpoon list" })
map("n", "<C-S-N>", function()
  harpoon:list():next()
end, { desc = "Harpoon toggle next buffer in Harpoon list" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
