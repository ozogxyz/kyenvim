-- add ~/.config/nvim to path to prevent stupid nested folders of neovim
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false
vim.g.netrw_banner = 0

require 'options'
require 'keymaps'
require 'autocommands'

-- Enable LSP servers defined in lsp/*.lua
vim.lsp.enable('lua_lsp')
vim.lsp.enable('go_lsp')
