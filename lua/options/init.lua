-- [[ opts.lua ]]
local options = {
    -- [[ Context ]]
    -- Show line numbers
    number = true,
    -- Show relative line numbers
    relativenumber = false,
    -- Minimum number lines of context
    scrolloff = 5,
    -- Highlight the cursor line for readability
    cursorline = true,

    -- [[ Filetypes ]]
    -- String encoding
    encoding = 'utf-8',
    -- File encoding
    fileencoding = 'utf-8',

    -- [[ Theme ]]
    -- Allow syntax highlighting
    syntax = 'ON',
    termguicolors = true,

    -- [[ Search ]]
    -- Ignore case in search patterns
    ignorecase = true,
    -- Override ignorecase if search contains capitals
    smartcase = true,
    -- Use incremental search
    incsearch = true,
    -- Highlight search matches
    --    smartcase = true,

    -- [[ Whitespace ]]
    -- Use spaces instead of tabs
    expandtab = true,
    -- Size of an indent
    smarttab = true,
    -- Number of spaces tabs count for in insert mode
    shiftwidth = 4,
    -- Number of spaces tabs count for
    tabstop = 4,

    -- [[ Splits ]]
    -- Place new window below the current one
    splitbelow = true,
    -- Place new window to right of current one
    splitright = true,
    wrap = false
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
