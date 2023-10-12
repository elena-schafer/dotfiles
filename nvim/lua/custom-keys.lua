local map = vim.api.nvim_set_keymap

map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})
map('n', '[b', [[:BufferLineCyclePrev<CR>]], {})
map('n', ']b', [[:BufferLineCycleNext<CR>]], {})
