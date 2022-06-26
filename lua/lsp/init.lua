-- [[ LSP ]]
local v_status_ok, nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not v_status_ok then
    print("CMP NVIM LSP failed to load!")
    return
end
local l_status_ok, lspconfig = pcall(require, 'lspconfig')
if not l_status_ok then
    print("LspConfig failed to load!")
    return
end

-- Use an on_attach funciton to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    -- See `:help vim.lsp.*` for docs on mappings below
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Jump to declaration of item
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- Jump to definition of item
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- Display tooltip in hover
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- Display all instances
    vim.keymap.set('n', 'gx', vim.lsp.buf.implementation, bufopts)
    -- Add the following folder to workspace
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- Remove the following folder from workspace
    vim.keymap.set('n', '<space>we', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- Open a list of folders in workspace
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    -- Jumps to the definition of the type of the symbol under the cursor
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    -- Rename value under cursor
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    -- Code Action
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.code_action, bufopts)
    -- get references
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- formatting
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
-- Setup lspconfig.
local capabilities = nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

USER = vim.fn.expand('$USER')

local sumneko_root_path = "/home/" .. USER .. "/.config/lua-language-server"
local sumneko_binary = "/home/" .. USER .. "/.config/lua-language-server/bin/lua-language-server"

lspconfig.sumneko_lua.setup {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
            }
        }
    }
}
