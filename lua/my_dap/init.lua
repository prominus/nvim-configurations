-- [[ Debug Addapter Protocol ]]
local d_status_ok, dap = pcall(require, 'dap')
if not d_status_ok then
    print("DAP failed to load!")
    return
end
-- [[ Mockup Debugger ]]
-- print("Type of dap:" .. type(dap))
dap.adapters.markdown = {
    type = "executable",
    name = "mockdebug",
    command = "node",
    args = { "./out/debugAdapter.js}" }
}


local p_status_ok, pydap = pcall(require, 'dap-python')
if not p_status_ok then
    print("DAP for Python failed to load!")
    return
end

-- [[ Python Adapter ]]
pydap.setup('~/.virtualenvs/debugpy/bin/python')

-- [[ Lua Adapter ]]
dap.configurations.lua = {
    {
        type = 'nlua',
        request = 'attach',
        name = "Attach to running Neovim instance",
        host = function()
            local value = vim.fn.input('Host [127.0.0.1]: ')
            if value ~= "" then
                return value
            end
            return '127.0.0.1'
        end,
        port = function()
            local val = tonumber(vim.fn.input('Port: '))
            assert(val, "Please provide a port number")
            return val
        end,
    }
}

dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host, port = config.port })
end

-- [[ Go Adapter ]]
local g_status_ok, godap = pcall(require, 'dap-go')
if not g_status_ok then
    print("DAP for GO failed to load!")
    return
end
godap.setup()
