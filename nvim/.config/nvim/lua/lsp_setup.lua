local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.clangd.setup{}
lspconfig.lua_ls.setup({
	cmd = { vim.fn.stdpath("data") .. "/mason/packages/lua-language-server/lua-language-server" },
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
			return
	end

	client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
		runtime = {
			-- Tell the language server which version of Lua you're using
			-- (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT'
		},
		-- Make the server aware of Neovim runtime files
		workspace = {
			checkThirdParty = false,
			library = {
				vim.env.VIMRUNTIME
				-- Depending on the usage, you might want to add additional paths here.
				-- "${3rd}/luv/library"
				-- "${3rd}/busted/library",
			}
		}
	})
  end,
  settings = {
    Lua = {}
  }
})

local ls = require("luasnip")

-- set tab to expand snippet if it can, else jump if it can, else just insert a tab character
vim.keymap.set({"i"}, "<Tab>", function()
		if ls.expandable() then
			ls.expand()
		elseif ls.jumpable() then
			ls.jump(1)
		else
			vim.api.nvim_put({"\t"}, "", false, true)
		end
	end, {silent = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.setup({
	update_events = 'TextChanged,TextChangedI'
})

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})

