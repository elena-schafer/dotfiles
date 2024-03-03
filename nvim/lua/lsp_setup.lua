lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.jdtls.setup{}
lspconfig.clangd.setup{}
lspconfig.lua_ls.setup{}

require('jdtls').start_or_attach({
	cmd = {'~/.local/nvim/mason/bin/jdtls'},
	root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	setting = {
		java = {
			signatureHelp = {enabled = true},
		}
	}
})
