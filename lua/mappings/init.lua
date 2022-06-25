-- Mappings
-- See `:help vim.diagnostic.*` for dos on functions below
local opts = { noremap=true, silent=true }
-- Set float in an open window
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- GOTO previous error
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- GOTO next error
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- Add buffer diagnostics to the location list
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- Snippet keymaps
vim.keymap.set('i', '<C-j>', "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set('s', '<C-j>', "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
vim.keymap.set('i', '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
vim.keymap.set('s', '<C-k>', "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- NVIM tree keymaps
local all_modes = { 'i', 'n', 's'}
vim.keymap.set(all_modes, 'E', ":NvimTreeToggle<CR>", opts)