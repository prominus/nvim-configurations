-- [[ opts.lua ]]
local set = vim.opt

-- [[ Context ]]
-- Show line numbers
set.number = true
-- Show relative line numbers
set.relativenumber = false
-- Minimum number lines of context
set.scrolloff = 5
-- Highlight the cursor line for readability 
set.cursorline = true

-- [[ Filetypes ]]
-- String encoding
set.encoding = 'utf-8'
-- File encoding
set.fileencoding = 'utf-8'

-- [[ Theme ]]
-- Allow syntax highlighting
set.syntax = 'ON'
set.termguicolors = true

-- [[ Search ]]
-- Ignore case in search patterns
set.ignorecase = true
-- Override ignorecase if search contains capitals
set.smartcase = true
-- Use incremental search
set.incsearch = true
-- Highlight search matches
set.smartcase = true

-- [[ Whitespace ]]
-- Use spaces instead of tabs
set.expandtab = true
-- Size of an indent
set.smarttab = true
-- Number of spaces tabs count for in insert mode
set.shiftwidth = 4
-- Number of spaces tabs count for
set.tabstop = 4

-- [[ Splits ]]
-- Place new window below the current one
set.splitbelow = true
-- Place new window to right of current one
set.splitright = true
set.wrap = false





