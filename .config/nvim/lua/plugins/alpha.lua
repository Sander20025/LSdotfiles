return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header (ASCII art)
        dashboard.section.header.val = {
            " ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            " ████╗  ██║██║   ██║██║████╗ ████║",
            " ██╔██╗ ██║██║   ██║██║██╔████╔██║",
            " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }

        -- Set menu options
        dashboard.section.buttons.val = {
            dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
            dashboard.button("n", "📄  New file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("r", "📂  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC<CR>"),
            dashboard.button("q", "❌  Quit", ":qa<CR>"),
        }

        -- Set footer
        dashboard.section.footer.val = {
            "Have a productive session!",
        }

        -- Apply the dashboard configuration
        dashboard.config.opts.noautocmd = true
        alpha.setup(dashboard.config)
    end,
}

