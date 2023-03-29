local telescope = require("telescope")

telescope.load_extension("workspaces")

telescope.setup({
  extensions = {
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = false,
    }
  }
})
