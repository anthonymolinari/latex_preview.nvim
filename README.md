<div align="center">

# `latex_preview.nvim`
##### launch a live preview of latex files with neovim

[![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)](http://www.lua.org)

</div>
## Description
Setting up live preview for latex can be annoying. Running both latexmk and 
your PDF viewer of choice and needed to manage those terminal sessions can 
be annoying. The goal of this plugin is to automate the process of launching a
live preview and do so without ever leaving the comfort of vim.

# Installation
Install `latex_preview` with `Packer.nvim`
```lua
use 'nvim-lua/plenary.nvim`
use 'anthonymolinari/latex_preview.nvim'
```

# Configuration

```lua
local latex_preview = require('latex_preview')

latex_preview.setup({
    mappings = {},
})
```

