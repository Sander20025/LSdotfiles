return {
    "rebelot/kanagawa.nvim",
    commit = "latest", -- Optional: Lock to a specific commit
    priority = 1000,   -- Ensure it loads first
    config = function()
        -- Kanagawa configuration
        require('kanagawa').setup({
            compile = false,             -- Enable compiling the colorscheme
            undercurl = true,            -- Enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,         -- Disable transparent background
            dimInactive = false,         -- Do not dim inactive windows
            terminalColors = true,       -- Enable terminal colors
            colors = {                   -- Add or modify theme colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- Add or modify highlights
                return {
                    -- Example overrides (optional)
                    NormalFloat = { bg = "none" }, -- Transparent floating windows
                    FloatBorder = { fg = colors.palette.blue },
                    DiagnosticVirtualTextError = { bg = "none" },
                    DiagnosticVirtualTextWarn = { bg = "none" },
                    DiagnosticVirtualTextInfo = { bg = "none" },
                    DiagnosticVirtualTextHint = { bg = "none" },
                }
            end,
            theme = "dragon",              -- Default theme ("wave", "dragon", "lotus")
            background = {               -- Background mapping
                dark = "dragon",
                light = "lotus",
            },
        })

        -- Apply the colorscheme
        vim.cmd("colorscheme kanagawa")

        -- Toggle transparency keymap
        local toggle_transparency = function()
            local config = require('kanagawa')
            config.transparent = not config.transparent
            require('kanagawa').setup(config)
            vim.cmd("colorscheme kanagawa")
        end

        vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
    end,
}
