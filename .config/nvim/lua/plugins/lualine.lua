return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- Define adjusted colors
		local colors = {
			primary = "#3b4252",
			secondary = "#434c5e",
			accent = "#81a1c1", -- Softer blue accent
			success = "#a3be8c", -- Green for success
			warning = "#d08770", -- Orange for warning
			error = "#bf616a", -- Red for error
			text = "#eceff4", -- Light text
			alt_text = "#d8dee9", -- Alternate light text
			background = "#2e3440",
			dimmed_bg = "#4c566a",
		}

		-- Define the lualine theme with adjusted colors
		local custom_theme = {
			normal = {
				a = { fg = colors.text, bg = colors.accent, gui = "bold" },
				b = { fg = colors.text, bg = colors.secondary },
				c = { fg = colors.alt_text, bg = colors.background },
			},
			insert = { a = { fg = colors.text, bg = colors.success, gui = "bold" } },
			visual = { a = { fg = colors.text, bg = colors.warning, gui = "bold" } },
			replace = { a = { fg = colors.text, bg = colors.error, gui = "bold" } },
			command = { a = { fg = colors.text, bg = colors.primary, gui = "bold" } },
			inactive = {
				a = { fg = colors.alt_text, bg = colors.dimmed_bg },
				b = { fg = colors.alt_text, bg = colors.background },
				c = { fg = colors.alt_text, bg = colors.background },
			},
		}

		-- Define lualine setup
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = custom_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "fugitive", "nvim-tree" },
		})
	end,
}

