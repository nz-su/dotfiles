require "nvchad.options"

-- add yours here!

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
}) -- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
