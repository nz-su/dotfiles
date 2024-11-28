local M = {}

-- General mappings
M.general = {
  i = {
    ["<C-b>"] = { "<ESC>^i", "Move to beginning of line" },
    ["<C-e>"] = { "<End>", "Move to end of line" },
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },
  n = {

    ["<C-h>"] = { "<C-w>h", "Switch window left" },
    ["<C-l>"] = { "<C-w>l", "Switch window right" },
    ["<C-j>"] = { "<C-w>j", "Switch window down" },
    ["<C-k>"] = { "<C-w>k", "Switch window up" },
    ["<Esc>"] = { "<cmd>noh<CR>", "Clear highlights" },
    ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
    ["<C-c>"] = { "<cmd>%y+<CR>", "Copy whole file" },
    ["<leader>n"] = { "<cmd>set nu!<CR>", "Toggle line numbers" },
    ["<leader>rn"] = { "<cmd>set rnu!<CR>", "Toggle relative numbers" },
    ["<leader>ch"] = { "<cmd>NvCheatsheet<CR>", "Toggle NvCheatsheet" },
    ["<leader>fm"] = { function() require("conform").format { lsp_fallback = true } end, "Format file" },
    ["<leader>ds"] = { vim.diagnostic.setloclist, "LSP diagnostic loclist" },
  },
  t = {
    ["<C-x>"] = { "<C-\\><C-N>", "Escape terminal mode" },
  },
}

-- Bufferline mappings
M.bufferline = {
  n = {
    ["<tab>"] = { function() require("nvchad.tabufline").next() end, "Buffer goto next" },
    ["<S-tab>"] = { function() require("nvchad.tabufline").prev() end, "Buffer goto previous" },
    ["<leader>b"] = { "<cmd>enew<CR>", "New buffer" },
    ["<leader>x"] = { function() require("nvchad.tabufline").close_buffer() end, "Close buffer" },
  },
}

-- Comment plugin mappings
M.comment = {
  n = {
    ["<leader>/"] = { "gcc", "Toggle comment", remap = true },
  },
  v = {
    ["<leader>/"] = { "gc", "Toggle comment", remap = true },
  },
}

-- NvimTree mappings
M.nvimtree = {
  n = {
    ["<C-n>"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
    ["<leader>e"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" },
  },
}

-- CMP Keybindings
M.cmp = function(cmp)
  return {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),

    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),

    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
  }
end

M.lsp = {
  n = {
    ["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
    ["gd"] = { vim.lsp.buf.definition, "Go to definition" },
    ["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
    ["<leader>sh"] = { vim.lsp.buf.signature_help, "Show signature help" },
    ["<leader>wa"] = { vim.lsp.buf.add_workspace_folder, "Add workspace folder" },
    ["<leader>wr"] = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
    ["<leader>wl"] = {
      function()

        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,

      "List workspace folders",
    },
    ["<leader>D"] = { vim.lsp.buf.type_definition, "Go to type definition" },
    ["<leader>ra"] = { require("nvchad.lsp.renamer"), "NvRenamer" },
    ["gr"] = { vim.lsp.buf.references, "Show references" },
  },
  v = {
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
  },
  n_v = {
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
  },
}

-- Telescope mappings
M.telescope = {
  n = {
    ["<leader>fw"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Help tags" },
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<leader>fa"] = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find all files" },
    ["<leader>fz"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },
    ["<leader>ma"] = { "<cmd>Telescope marks<CR>", "Find marks" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<CR>", "Find old files" },
    ["<leader>cm"] = { "<cmd>Telescope git_commits<CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd>Telescope git_status<CR>", "Git status" },
    ["<leader>pt"] = { "<cmd>Telescope terms<CR>", "Pick hidden terminal" },
    ["<leader>th"] = { function() require("nvchad.themes").open() end, "NvChad themes" },
  },
}

-- Terminal mappings
M.terminal = {
  n = {
    ["<leader>h"] = { function() require("nvchad.term").new { pos = "sp" } end, "New horizontal terminal" },
    ["<leader>v"] = { function() require("nvchad.term").new { pos = "vsp" } end, "New vertical terminal" },
  },
  t = {
    ["<A-v>"] = { function() require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" } end, "Toggle vertical terminal" },
    ["<A-h>"] = { function() require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" } end, "Toggle horizontal terminal" },
    ["<A-i>"] = { function() require("nvchad.term").toggle { pos = "float", id = "floatTerm" } end, "Toggle floating terminal" },
  },
}

-- WhichKey mappings

M.whichkey = {
  n = {
    ["<leader>wK"] = { "<cmd>WhichKey<CR>", "Show all keymaps" },
    ["<leader>wk"] = { function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end, "Query keymap" },
  },
}

return M
