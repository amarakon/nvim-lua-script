Neovim Lua Script
================

## Contents

-   <a href="#introduction" id="toc-introduction">Introduction</a>
-   <a href="#installation" id="toc-installation">Installation</a>
    -   <a href="#vim-plug" id="toc-vim-plug">Vim Plug</a>
    -   <a href="#vim" id="toc-vim">Vim</a>
    -   <a href="#neovim" id="toc-neovim">Neovim</a>
-   <a href="#setup" id="toc-setup">Setup</a>
-   <a href="#usage" id="toc-usage">Usage</a>
    -   <a href="#list-of-functions-and-variables"
        id="toc-list-of-functions-and-variables">List of functions and
        variables</a>
    -   <a href="#converting-from-vim-script"
        id="toc-converting-from-vim-script">Converting from Vim Script</a>

## Introduction

Due to the hype of the excellent Lua support that Neovim provides, many
people want to move their configuration to Lua from Vim Script. However,
it is much more difficult to configure Neovim via Lua than Vim Script,
despite Lua being an easy programming language. This does not change the
fact that Lua is a better and more robust language, so this trade-off is
worth it. What if I told you that you do not need to have a trade-off?
You can actually configure Neovim easier with Lua than with Vim Script
with this plugin.

## Installation

### Vim Plug

``` vim
Plug "amarakon/nvim-lua-script"
```

### Vim

``` sh
`# user` git clone https://github.com/amarakon/nvim-sensible ~/.vim/pack/vendor/start/nvim-sensible
```

### Neovim

``` sh
`# user` git clone https://github.com/amarakon/nvim-sensible ~/.local/share/nvim/site/pack/default/start/nvim-sensible
```

## Setup

To set up the functions and variables provided by this plugin, simply
put the following line in your Lua configuration. If you are configuring
Neovim with Vim, add `lua` in front of the following line.

``` lua
require("lua-script")
```

## Usage

### List of functions and variables

#### Keybindings

##### Basic

You have to specify the mode for these functions.

-   `keymap(mode, lhs, rhs, opts)`
-   `keynoremap(mode, lhs, rhs, opts)`

##### Modal

-   `nmap(lhs, rhs, opts)`
-   `imap(lhs, rhs, opts)`
-   `vmap(lhs, rhs, opts)`
-   `cmap(lhs, rhs, opts)`
-   `omap(lhs, rhs, opts)`

##### Regular

These keybindings apply to normal and visual mode.

-   `map(lhs, rhs, opts)`
-   `noremap(lhs, rhs, opts)`

#### Auto-commands

-   `autocmd(type, match, opts)`

#### Options

-   `g` = `vim.g`
-   `o` = `vim.o`
-   `opt` = `vim.opt`

### Converting from Vim Script

Using the concepts provided by this plugin, I will convert the first
code block (Vim Script) into the second code block (Lua).

``` vim
nmap <Space> <nop>
imap <C-c> #<Space>
noremap tn <Escape>

let g:mapleader = " "
set pumheight=5

autocmd TextYankPost * lua vim.highlight.on_yank { higroup = "Visual" }
```

``` lua
nmap("<Space>", "") -- No need to use `<nop>`
imap("<C-c>", "# ") -- No trailing whitespace by using a space character
map("tn", "<Escape>")

g.mapleader = " " -- Fewer columns of code
opt.pumheight = 5

autocmd("TextYankPost", "*", function ()
    vim.highlight.on_yank { higroup = "Visual" } -- No need to call Lua from Vim
end)
```
