return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Define custom highlight groups
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ff9252", bold = true })
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#9ece6a", italic = true })

        -- Set header (ASCII art)
        dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]], 
    }

        dashboard.section.header.opts.hl = "AlphaHeader"

        -- Set menu options
        dashboard.section.buttons.val = {
            dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
            dashboard.button("n", "📄  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("r", "📂  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC<CR>"),
            dashboard.button("q", "❌  Quit", ":qa<CR>"),
        }
        dashboard.section.buttons.opts.hl = "AlphaButtons"

        -- Set footer
        dashboard.section.footer.val = {
            "Have a productive session Sander!",
            "You fucking bellend :) "
        }
        dashboard.section.footer.opts.hl = "AlphaFooter"

        -- Apply the dashboard configuration
        dashboard.config.opts.noautocmd = true
        alpha.setup(dashboard.config)
    end,
}

