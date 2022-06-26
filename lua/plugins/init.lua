local use = require('packer').use

-- Have packer use a popup window
require'packer'.init {
    display = {
        open_fn = function()
            return require'packer.util'.float {
                border = 'rounded'
            }
        end
    }
}

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Configurations for Nvim LSP
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
     -- Status Bar
    use { 
        'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
     }
    -- Find, Filter, Preview
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    -- code structure
    use {'majutsushi/tagbar'}
    -- see indentation
    use {'Yggdroot/indentLine'}
    -- git integration                   
    use {'tpope/vim-fugitive'}
    -- commit history                    
    use {'junegunn/gv.vim'}
    -- auto close brackets, etc.                       
    use {'windwp/nvim-autopairs'}
end)
