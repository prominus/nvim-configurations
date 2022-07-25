-- [[ Set up file explorer icons ]]
local i_status_ok, devicon = pcall(require, 'nvim-web-devicons')
if not i_status_ok then
    print("Icons failed to load!")
    return
end

devicon.setup {}
devicon.get_icons()

-- [[ Set up colorizer ]]
local c_status_ok, colorizer = pcall(require, 'colorizer')
if not c_status_ok then
    print("Colorizer failed to load!")
    return
end
colorizer.setup()


-- [[ Set up color scheme]]
vim.g.colors_name = "nvb-everforest"

local s_status_ok, scheme = pcall(require, 'appearance.colorscheme')
if not s_status_ok then
    print("Scheme failed to load!")
    return
end
scheme.setup {
    base00 = "#2b3339",
    base01 = "#323c41",
    base02 = "#503946",
    base03 = "#868d80",
    base04 = "#d3c6aa",
    base05 = "#d3c6aa",
    base06 = "#e9e8d2",
    base07 = "#fff9e8",
    base08 = "#7fbbb3",
    base09 = "#d699b6",
    base0A = "#83c092",
    base0B = "#dbbc7f",
    base0C = "#e69875",
    base0D = "#a7c080",
    base0E = "#e67e80",
    base0F = "#d699b6",
}

-- [[ Set up status bar ]]
local l_status_ok, lualine = pcall(require, 'lualine')
if not l_status_ok then
    print("Lualine failed to load!")
    return
end
lualine.setup {
    options = {
        theme = 'gruvbox_dark',
    },
}

-- [[ Smarter Syntax Highlighting ]]
local t_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not t_status_ok then
    print("TreeSitter failed to load!")
    return
end
treesitter.setup {
    -- A list of parser names
    ensure_installed = { 'c', 'css', 'go', 'json', 'lua', 'typescript' },

    -- Install parsers synchronously
    sync_install = false,
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = { "" },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_fill_line = nil,
    }
}