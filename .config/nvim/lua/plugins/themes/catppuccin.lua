return {
	"catppuccin/nvim",
	commit = "latest", -- Optional: Lock to a specific commit
	priority = 1000, -- Ensure it loads first
	config = function()
		-- Catppuccin configuration
		local config = {
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- Disable background color
			show_end_of_buffer = false, -- Disable '~' at the end of buffers
			term_colors = true, -- Enable terminal colors
			dim_inactive = {
				enabled = false, -- Disable dimming inactive windows
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false, -- Allow italic text
			no_bold = false, -- Allow bold text
			no_underline = false, -- Allow underlined text
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			custom_highlights = {}, -- Custom highlights
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		}

		local catppuccin = require("catppuccin")
		catppuccin.setup(config)
		vim.cmd.colorscheme("catppuccin")

		-- Custom highlights for diagnostics
		local set_diagnostics_bg_transparency = function()
			vim.cmd([[highlight DiagnosticVirtualTextError guibg=none]])
			vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=none]])
			vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=none]])
			vim.cmd([[highlight DiagnosticVirtualTextHint guibg=none]])
		end
		set_diagnostics_bg_transparency()

		-- Toggle transparency
		local toggle_transparency = function()
			config.transparent_background = not config.transparent_background
			catppuccin.setup(config)
			vim.cmd.colorscheme("catppuccin")
			set_diagnostics_bg_transparency()
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
	end,
}
