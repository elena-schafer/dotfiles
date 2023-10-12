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

-- Setup nvim-tree window auto closing when all buffers in tab are closed
local function close_nvim_tree_on_exit(data)
  
  if require("nvim-tree.api").tree.is_visible() and #vim.api.nvim_tabpage_list_wins(0) == 2 then
    require("nvim-tree.api").tree.close_in_this_tab()
  end
end

vim.api.nvim_create_autocmd({ "QuitPre" }, { callback = close_nvim_tree_on_exit })

--nvim-tree-api.events.subscribe("FlieCreated", { callback = })
--tree.reload()
