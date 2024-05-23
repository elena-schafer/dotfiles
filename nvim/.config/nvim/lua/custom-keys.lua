local map = vim.api.nvim_set_keymap

-- Nvim-Tree keybinds
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

--BufferLine keybinds
map('n', '[b', [[:bp<CR>]], {})
map('n', ']b', [[:bn<CR>]], {})
map('n', '<leader>b1', [[:LualineBuffersJump 1<CR>]], {})
map('n', '<leader>b2', [[:LualineBuffersJump 2<CR>]], {})
map('n', '<leader>b3', [[:LualineBuffersJump 3<CR>]], {})
map('n', '<leader>b4', [[:LualineBuffersJump 4<CR>]], {})
map('n', '<leader>b5', [[:LualineBuffersJump 5<CR>]], {})
map('n', '<leader>b6', [[:LualineBuffersJump 6<CR>]], {})
map('n', '<leader>b7', [[:LualineBuffersJump 7<CR>]], {})
map('n', '<leader>b8', [[:LualineBuffersJump 8<CR>]], {})
map('n', '<leader>b9', [[:LualineBuffersJump 9<CR>]], {})
map('n', '<leader>b0', [[:LualineBuffersJump 0<CR>]], {})
map('n', '<leader>b$', [[:LualineBuffersJump $<CR>]], {})

--Telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--Leap keybinds
vim.keymap.set('n', 'S', '<Plug>(leap-backward)', {})

--TODO-Comments keybinds
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
map('n', '<leader>ft', [[:TodoTelescope<CR>]], {})

--LSP keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = event.buf}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Display documentation of the symbol under the cursor
    bufmap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    -- bufmap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    vim.keymap.set({ "v", "n" }, "<leader>la", require("actions-preview").code_actions)
  end
})

--dirbuf keybinds
map('n', '<leader>d', [[:Dirbuf ]], {})

