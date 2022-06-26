-- Autoformat
local group = vim.api.nvim_create_augroup("autoformat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre",
    { callback = function()
        vim.lsp.buf.formatting_sync()
    end,
        group = group
    })
