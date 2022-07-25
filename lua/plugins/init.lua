-- [[ PLUGINS ]]
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    print("Packer did not load!")
    return
end
-- local packer = require('packer')
local use = packer.use

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require 'packer.util'.float {
                border = 'rounded'
            }
        end
    }
}

return packer.startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    -- [[ Language Server Client ]]
    use 'neovim/nvim-lspconfig'
    -- Plugin for nvim-conf autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- Snippets
    use 'rafamadriz/friendly-snippets'
    -- Complex file system explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    -- Color
    use 'norcalli/nvim-colorizer.lua'
    -- Smarter syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- Rainbow brackets
    use 'p00f/nvim-ts-rainbow'
    -- Status Bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    -- [[ Telescope - Find, Filter, Preview ]]
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    -- code structure
    -- use { 'majutsushi/tagbar' }
    -- see indentation
    use { 'Yggdroot/indentLine' }
    -- git integration
    -- use { 'tpope/vim-fugitive' }
    -- commit history
    -- use { 'junegunn/gv.vim' }
    -- auto close brackets, etc.
    use { 'windwp/nvim-autopairs' }
    -- [[ Commenting out ]]
    use 'b3nj5m1n/kommentary'
    -- [[ Debug Adapter Protocol ]]
    use 'mfussenegger/nvim-dap'
    use {
        'mfussenegger/nvim-dap-python',
        requires = { 'mfussenegger/nvim-dap' }
    }
    use {
        'jbyuki/one-small-step-for-vimkind',
        requires = { 'mfussenegger/nvim-dap' }
    }
    use {
        'leoluz/nvim-dap-go',
        requires = { 'mfussenegger/nvim-dap' }
    }
end)
