local util = require("zk.util")
-- Add the key mappings only for Markdown files in a zk notebook.
if util.notebook_root(vim.fn.expand('%:p')) ~= nil then
	local zk = require("zk")

	-- Zero here means current buffer
  local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
  local opts = { noremap=true, silent=false }

  -- Open the link under the caret.
  map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- Create a new note after asking for its title, and insert a link to it at current cursor location.
	map("n", "<leader>zci", "<cmd>ZkNewWithLink<CR>", opts)

  -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
  -- map("v", "<leader>znc", ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)

  -- Open notes linking to the current buffer.
  map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
  -- Alternative for backlinks using pure LSP and showing the source context.
  --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- Open notes linked by the current buffer.
  map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

  -- Preview a linked note.
  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

  map("n", "<leader>za", "<Cmd>ZkAddLink<CR>", opts)

	-- Jump to next link?
end
