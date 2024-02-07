local map = vim.api.nvim_set_keymap

-- Nvim-Tree keybinds
map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})

--BufferLine keybinds
map('n', '[b', [[:BufferLineCyclePrev<CR>]], {})
map('n', ']b', [[:BufferLineCycleNext<CR>]], {})
map('n', '<leader>bp', [[:BufferLineTogglePin<CR>]], {})

local function sleep(a)
    local sec = tonumber(os.clock() + a); 
    while (os.clock() < sec) do 
    end 
end

local function closeBuffer ()
  local bufferline = require('bufferline')
  if (#bufferline.get_elements().elements ~= 1) then
    bufferline.cycle(-1)
    bufferline.close_in_direction(1)
  else
    vim.api.nvim_buf_delete(0, {})
    vim.cmd([[enew]])
    --bufferline.go_to(#bufferline.get_elements().elements)
    --sleep(1)
    --vim.cmd([[lua require('bufferline').close_others()]])
    --bufferline.close_others()
    --bufferline.close_in_direction(-1)
  end
  --vim.cmd([[ <Cmd>BufferLine<CR> ]])
end
vim.keymap.set('n', '<leader>q', closeBuffer, {})

--floaterm keybinds
--map('n', '<leader>ft', [[:FloatermNew<CR>]], {})
map('n', '<leader>t', [[:FloatermToggle<CR>]], {})
--map('n', '<M->', [[:FloatermNext<CR>]], {})
--map('n', '<M->', [[:FloatermPrev<CR>]], {})

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
    bufmap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  end
})

--dirbuf keybinds
map('n', '<leader>d', [[:Dirbuf ]], {})
