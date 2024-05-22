vim.opt.conceallevel = 2

require("obsidian").setup({
  workspaces = {
    {
      name = "notes",
      path = "~/notes",
    },
  },
	notes_subdir = "notes",
	mappings = {
		["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
	},
  daily_notes = {
    folder = "notes/daily",
  },
	-- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,
})

vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>")
vim.keymap.set("n", "<leader>oj", "<cmd>ObsidianToday<CR>")
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<CR>")
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>")
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianSearch<CR>")
--vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<CR>")
--vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>")
vim.keymap.set("n", "<leader>oc", "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew ")
vim.keymap.set("n", "<leader>oe", ":ObsidianExtractNote ")
