dofile(vim.g.base46_cache .. "telescope")

return {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
    pickers = {
      live_grep = {
        additional_args = { "--hidden" }
      },
      grep_string = {
        additional_args = { "--hidden" }
      },
    },
  },

  extensions_list = { "themes", "terms" },
  extensions = {},
}
