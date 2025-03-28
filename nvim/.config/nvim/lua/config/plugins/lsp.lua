return {
	-- ?
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "neovim/nvim-lspconfig" },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", works = { "vim%.uv" } }
					}
				},
			},
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								telemetry = { enable = false },
								runtime = { version = "LuaJIT" },
								diagnostics = { globals = { "vim" } },
								workspace = {
									checkThirdParty = false,
									library = vim.api.nvim_get_runtime_file("", true),
								},
								hint = { enable = true },
							},
						},
					})
				end
			})

			-- Add autocommands and keybinds when lsp attaches to buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end
					if client.supports_method("textDocument/formatting") then
						-- Before write format the file
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end
						})
					end
					vim.keymap.set("n", "grn", vim.lsp.buf.rename)
					vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
					vim.keymap.set("n", "grr", vim.lsp.buf.references)
					vim.keymap.set("n", "gri", vim.lsp.buf.implementation)
					vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol)
				end
			})
		end
	},
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		{ "hrsh7th/cmp-nvim-lua" },             -- ?
	-- 		{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- ?
	-- 		{ "hrsh7th/cmp-vsnip" },                -- ?
	-- 		{ "hrsh7th/cmp-path" },                 -- ?
	-- 		{ "hrsh7th/cmp-buffer" },               -- ?
	-- 	},
	-- 	config = function()
	-- 		vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
	-- 		vim.opt.shortmess = vim.opt.shortmess + { c = true }
	--
	-- 		local cmp = require 'cmp'
	-- 		cmp.setup({
	-- 			preselect = cmp.PreselectMode.None,
	--
	-- 			mapping = {
	-- 				['<C-b>'] = cmp.mapping.scroll_docs(-4),
	-- 				['<C-f>'] = cmp.mapping.scroll_docs(4),
	-- 				['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	-- 				['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	-- 				['<Leader>c'] = cmp.mapping.complete(),
	-- 				['<C-y>'] = cmp.mapping.confirm({
	-- 					behavior = cmp.ConfirmBehavior.Insert,
	-- 					select = true,
	-- 				}),
	-- 			},
	-- 			-- sources are the installed sources that can be used for code suggestions
	-- 			sources = {
	-- 				{ name = 'path' },
	-- 				{ name = 'nvim_lsp',               keyword_length = 3 },
	-- 				{ name = 'nvim_lsp_signature_help' },
	-- 				{ name = 'nvim_lua',               keyword_length = 2 },
	-- 				{ name = 'buffer',                 keyword_length = 2 },
	-- 				{ name = 'luasnip',                keyword_length = 2 },
	-- 			}
	-- 		})
	-- 	end
	-- },                                 -- ?
	-- { "aznhe21/actions-preview.nvim" }, -- ?
}
--LSP keybinds
-- vim.api.nvim_create_autocmd('LspAttach', {
--   desc = 'LSP actions',
--   callback = function(event)
--     local bufmap = function(mode, lhs, rhs)
--       local opts = {buffer = event.buf}
--       vim.keymap.set(mode, lhs, rhs, opts)
--     end
--
--     -- Display documentation of the symbol under the cursor
--     bufmap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.hover()<cr>')
--
--     -- Jump to the definition
--     bufmap('n', '<leader>lg', '<cmd>lua vim.lsp.buf.definition()<cr>')
--
--     -- Renames all references to the symbol under the cursor
--     bufmap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>')
--
--     -- Selects a code action available at the current cursor position
--     -- bufmap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>')
--     vim.keymap.set({ "v", "n" }, "<leader>la", require("actions-preview").code_actions)
--   end
-- })
