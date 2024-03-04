-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
 -- on_attach = function()
 --   
 -- end,
  disable_netrw = true,
  hijack_cursor = true,
  view = {
    width = 45
  },
  hijack_directories = { enable = false },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    severity = { min = vim.diagnostic.severity.ERROR }
  }
})

-- we must manually script startup on open
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.toggle({ focus = false })
end

-- setup start on open
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- setup start on new tab
vim.api.nvim_create_autocmd({ "TabNew" }, { callback = open_nvim_tree })

