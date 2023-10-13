vim.wo.number = true

require('plugins')
require('mason-config')
require('jdtls')
require('code-completion')
require('file-explorer')
require('custom-keys')
require('statusline')
require('pairing')
require('git-integration')
require('sitter')
require('indent')
-- tabs must be after color-scheme for it to have correct theme
require('color-scheme')
require('tabs')
require('file-search')
