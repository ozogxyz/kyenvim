-- Add ~/.config/nvim to path to prevent unnecessarily nested directories of neovim
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

require 'options'
require 'keymaps'
require 'autocommands'

-- Minimal LSP setup (Neovim 0.11+)
vim.lsp.config('lua_lsp', {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
	filetypes = { "lua" },
})


vim.lsp.config('go_lsp', {
	cmd = {'gopls'},
	filetypes = {'go'},
	root_markers = {'go.mod'},
})

vim.lsp.enable('lua_lsp')
vim.lsp.enable('go_lsp')
