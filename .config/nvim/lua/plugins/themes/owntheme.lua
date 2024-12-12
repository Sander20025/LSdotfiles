-- lua/plugins/themes/owntheme.lua
local M = {}

function M.setup()
    local colors = {
        bg = "#111111",
        fg = "#eeeeee",
        comment = "#686868",
        keyword = "#c678dd",
        string = "#98c379",
        function_name = "#61afef",
        variable = "#e5c07b",
        type = "#e06c75",
        constant = "#d19a66",
    }

    -- Clear highlights and ensure termguicolors is enabled
    vim.cmd("highlight clear")
    vim.opt.termguicolors = true
    vim.opt.background = "dark"

    -- Set the background and foreground for Normal
    vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })

    -- Debug: Print the current background color
    print("Background applied:", colors.bg)

    -- Other highlights
    vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
    vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, bold = true })
    vim.api.nvim_set_hl(0, "String", { fg = colors.string })
    vim.api.nvim_set_hl(0, "Function", { fg = colors.function_name })
    vim.api.nvim_set_hl(0, "Variable", { fg = colors.variable })
    vim.api.nvim_set_hl(0, "Type", { fg = colors.type, bold = true })
    vim.api.nvim_set_hl(0, "Constant", { fg = colors.constant })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e1e1e" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555" })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#333333" })
end

return M
