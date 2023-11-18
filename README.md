<div align="center">

# `latex_preview.nvim`
##### launch a live preview of latex files with neovim

## this plugin is being actively developed, and may not be in working order

[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)

</div>

## Description
The goal of this plugin is to automate the process of launching and managing a
live preview and do so without ever leaving the comfort of vim.

### Current Feautres
- `Preview()` start a latex preview with latexmk and opens preview w/ default viewer
- `StopPreview()` kill latexmk process

### Todo
- write pdftotext to buffer, provide toggle function for keybinding
- Configuration:
    - default keymapings to start and stop preview
    - path to pdf view of choice

# Installation
Install `latex_preview` with `Packer.nvim`. Requires `latexmk` 
```lua
use 'nvim-lua/plenary.nvim`
use 'anthonymolinari/latex_preview.nvim'
```

# Configuration
```lua
local lp = require('latex_preview')

lp.setup({
    mappings = {},
})

vim.keymap.set('n', '<leader>pf', lp.Preview, {})
vim.keymap.set('n', '<leader>cf', lp.StopPreview, {})

```
# References
Repos used for refence will working on this plugin:

[buffer_manager.nvim](https://github.com/j-morano/buffer_manager.nvim)
[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

