local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<Leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<Leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<Leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<Leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<Leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<Leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<Leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<Leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<Leader>9", function() harpoon:list():select(9) end)
