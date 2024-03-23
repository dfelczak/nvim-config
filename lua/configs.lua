local o = vim.opt -- Assign Vim's options table to the local variable 'o'
local bo = vim.bo -- Assign Vim's buffer-specific options table to 'bo'
local wo = vim.wo -- Assign Vim's window-specific options table to 'wo'

-- Configs
o.number = true -- Enable line numbers
o.relativenumber = true -- Enable relative line numbers
o.wrap = false -- Disable automatic line wrapping
o.termguicolors = true -- Enable true color support in the terminal
vim.g.mapleader = " " -- Set the 'mapleader' to the space key

vim.cmd([[colorscheme tokyonight-night]]) -- Load the 'tokyonight-night' colorscheme

-- Essential settings
o.syntax = "on" -- Enable syntax highlighting
o.errorbells = false -- Disable error bells (beeps)
o.smartcase = true -- Enable case-sensitive search with lowercase unless a capital is present
o.showmode = false -- Hide the current mode in the status line
bo.swapfile = false -- Disable swap file creation
o.backup = false -- Disable creating backup files
o.undodir = vim.fn.stdpath("config") .. "/undodir" -- Set directory for undo files
o.undofile = true -- Enable persistent undo
o.incsearch = true -- Enable incremental search (highlight matches as you type)
o.hidden = true -- Allow switching buffers without saving current changes
o.completeopt = "menuone,noinsert,noselect" -- Tweak autocomplete behavior

-- Indentation
bo.autoindent = true -- Auto-indent new lines based on previous line
bo.smartindent = true -- Enable 'smart' auto-indentation
o.tabstop = 2 -- Width of a tab character
o.softtabstop = 2 -- Number of spaces used when pressing tab key
o.shiftwidth = 2 -- Number of spaces used for auto-indentation
o.expandtab = true -- Convert tabs to spaces

wo.signcolumn = "yes" -- Enable the sign column (for visualizing markers)
vim.opt.clipboard = "unnamedplus"
