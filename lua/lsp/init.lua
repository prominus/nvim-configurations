
-- Use an on_attach funciton to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    -- See `:help vim.lsp.*` for docs on mappings below
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- Jump to declaration of item 
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, butopts)
    -- Jump to definition of item 
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, butopts)
    -- Display tooltip in hover 
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, butopts)
    -- Display all instances
    vim.keymap.set('n', 'gx', vim.lsp.buf.implementation, butopts)
    -- Add the following folder to workspace
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, butopts)
    -- Remove the following folder from workspace
    vim.keymap.set('n', '<space>we', vim.lsp.buf.remove_workspace_folder, butopts)
    -- Open a list of folders in workspace 
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    -- Jumps to the definition of the type of the symbol under the cursor
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, butopts)   
    -- Rename value under cursor
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, butopts)
    -- Code Action 
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.code_action, butopts)
    -- get references 
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, butopts)
    -- formatting 
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, butopts)
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup{
   on_attach = on_attach,
   capabilities = capabilities
} 

require'lspconfig'.gopls.setup{
   on_attach = on_attach,
   capabilities = capabilities
}
