-- [[ Mappings ]]
-- [[ Modes ]]
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- [[ Leader ]]
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- Table to set all modes for keymapping
local toggle_modes = { 'n', 's', 'v', 'x', 't' }
local opts = {
    noremap = true,
    silent = true
}

-- [[ Diagnostics ]]
-- Set float in an open window
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- GOTO previous error
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- GOTO next error
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- Add buffer diagnostics to the location list
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- [[ Snippets]]
local snip_jump = function(j)
    require 'luasnip'.jump(j)
end
vim.keymap.set('i', '<C-j>', function()
    snip_jump(1)
end, opts)
vim.keymap.set('s', '<C-j>', function()
    snip_jump(1)
end, opts)
vim.keymap.set('i', '<C-k>', function()
    snip_jump(-1)
end, opts)
vim.keymap.set('s', '<C-k>', function()
    snip_jump(-1)
end, opts)

-- [[ NVIM Tree]]
vim.keymap.set(toggle_modes, 'T', ":NvimTreeToggle<CR>", opts)

-- [[ Window Nav ]]
vim.keymap.set('n', "wh", "<C-w>h", opts)
vim.keymap.set('n', "wj", "<C-w>j", opts)
vim.keymap.set('n', "wk", "<C-w>k", opts)
vim.keymap.set('n', "wl", "<C-w>l", opts)

-- [[ Window Resize ]]
vim.keymap.set('n', 'C-Up', ":resize +2<CR>", opts)
vim.keymap.set('n', 'C-Down', ":resize -2<CR>", opts)
vim.keymap.set('n', 'C-Left', ":vertical -2<CR>", opts)
vim.keymap.set('n', 'C-Right', ":vertical +2<CR>", opts)

-- [[ VS Code Indent]]
vim.keymap.set('v', '<Tab>', ">gv", opts)
vim.keymap.set('v', '<S-Tab>', "<gv", opts)

-- [[ VS Code Move Text]]
vim.keymap.set('v', '<A-j', ":m .+1<CR>==", opts)
vim.keymap.set('v', '<A-k', ":m .-2<CR>==", opts)
-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Hold onto what is in clipboard instead of yanking what is being pasted over
vim.keymap.set('v', "p", '"_dP', opts)

-- [[ Telescope ]]
vim.keymap.set('n', "ff", function()
    local status_ok, telescope = pcall(require, 'telescope.builtin')
    if not status_ok then
        print("Telescope failed to load!")
        return
    end
    telescope.find_files({
        hidden = true,
        no_ignore = true,
    })
end, opts)
vim.keymap.set("n", "fw", "<cmd>Telescope live_grep<cr>", opts)
