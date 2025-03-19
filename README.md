# **kyenvim – Know Your Editor Neovim**  

## **Know Your Editor, set up LSP using native API**

If you are like me and:

- You want to learn your editor and use what's **built-in** instead of relying on plugins.
- You don’t like it when you don’t know what software installs what and where.  
- You want to have full control over your system—**no hidden abstractions**.  

--- 

## **Neovim’s LSP: Why You Don’t Need *Three Different* Plugins to set it up**  

I also needed LSP support (which is why I switched to Neovim from Vim, so my priority was getting LSP working out-of-the-box. 

When I switched to Neovim from Vim, I was confused by the complexity of setting up LSP.  
- Why is there `Mason`, `mason-lspconfig`, and `nvim-lspconfig`?  
- Why are there **three** plugins just to set up LSP when Neovim already supports it natively?  
- What if I manually install LSP servers and just tell Neovim where to find them?  

I did exactly that, following [this article](https://boltless.me/posts/neovim-config-without-plugins-2025/) and the [Neovim LSP API](https://neovim.io/doc/user/lsp.html).

Starting from Neovim 0.11+ (nightly) it's now a breeze to configure a language servesrs:

```lua
vim.lsp.config('<custom-name>', {
    cmd = { "gopls" },
    root_markers = { "go.mod" },
    filetypes = { "go" },
})
vim.lsp.enable('<custom-name>')
```
That’s it. Just Neovim doing what it already knows how to do.

---


## **What Neovim Already Does for You**  

Neovim 0.11+ also comes with default keybindings in LSP defaults, so you **don’t need plugins for common features** ([docs](https://neovim.io/doc/user/lsp.html#lsp-defaults)) so you don’t need to configure keymaps, diagnostics, or completion manually.  

- **Code navigation** → Go to definition (`gd`), references (`grr`), implementation (`gri`)  
- **Editing support** → Rename (`grn`), format (`gq`), code actions (`gra`)  
- **Diagnostics** → Inline errors, hover (`K`), signature help (`CTRL-S` in Insert mode)  
- **Completion & tags** → `CTRL-X CTRL-O` for omnifunc, `CTRL-]` for tag jumps  

If your language server supports it, **Neovim enables it automatically**. No need for extra plugins.

---
## **No Nested Directories – Keep It Flat**  

```bash
~/.config/nvim/
├── init.lua
├── options.lua
├── keymaps.lua
└── autocommands.lua
```
**Why? Because it works.**

When I switched from Vim to Neovim, I was quite confused by the complex nested directories.  
- What’s the `lua/` folder?  
- Why is there both a `plugin/` folder and a `lua/someuser/plugins/` folder?  

For someone not familiar with Lua it was **complicated** and confusing. I’m sure there are valid reasons for it, such as Lua’s module system and backward compatibility, but I wanted a flat structure with **minimal complexity**. 

Yes, **I know you can throw everything inside `init.lua`** but when your options list, custom keymaps and autocommands grow, a single `init.lua` can become quite long. I just like to separate those into different files but that doesn't mean I have to use the default weird nested structure. 

You don’t need actually need a `lua/` directory. Vim has always loaded configs from `~/.vim`, and Neovim can do the same from `~/.config/nvim`.

Just add this in `init.lua`, and Neovim will find your files without needing `lua/` or other `plugin/, plugins/` and what-not directories:  

```lua
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'
```

## **The Whole `init.lua`**  

Here’s **everything in one file**. You don't even need creating files or directories for LSP. Toss the lsp commands in `init.lua` if they're not gigantic (like in most configs out there which repeat what's built-in unnecessarily): 

```lua

-- Add ~/.config/nvim to path to prevent unnecessarily nested directories of neovim
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'

require 'options'
require 'keymaps'
require 'autocommands'

-- Minimal LSP setup (Neovim 0.11+)
vim.lsp.config('lua_lsp', {
    cmd = { "lua-language-server" },
    root_markers = { ".luarc.json", ".git" },
    filetypes = { "lua" },
})

vim.lsp.config('go_lsp', {
    cmd = { "gopls" },
    root_markers = { "go.mod" },
    filetypes = { "go" },
})

vim.lsp.enable('lua_lsp')
vim.lsp.enable('go_lsp')
```
