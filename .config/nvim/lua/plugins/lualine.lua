return {
  "nvim-lualine/lualine.nvim",
  config = function()
    -- Define colors based on Sonokai theme (Andromeda variant)
    local colors = {
      primary = "#2d2a2e", -- Main background from Sonokai
      secondary = "#3e3a40", -- Secondary background
      accent = "#ff9262", -- Softer blue-green accent
      success = "#8fbcbb", -- Softer green for success
      warning = "#e7c664", -- Yellow for warning
      error = "#f38ba8", -- Red for errors
      text = "#e3e1e4", -- Light text color
      alt_text = "#dcd7d8", -- Alternative light text color
      background = "#1e1c1f", -- Background color
      dimmed_bg = "#3a3a3f", -- Dimmed background
    }

    -- Define a custom lualine theme with Sonokai-inspired colors
    local custom_theme = {
      normal = {
        a = { fg = colors.text, bg = colors.accent, gui = "bold" },
        b = { fg = colors.text, bg = colors.secondary },
        c = { fg = colors.alt_text, bg = colors.primary },
      },
      insert = {
        a = { fg = colors.text, bg = colors.success, gui = "bold" },
      },
      visual = {
        a = { fg = colors.text, bg = colors.warning, gui = "bold" },
      },
      replace = {
        a = { fg = colors.text, bg = colors.error, gui = "bold" },
      },
      command = {
        a = { fg = colors.text, bg = colors.secondary, gui = "bold" },
      },
      inactive = {
        a = { fg = colors.alt_text, bg = colors.dimmed_bg },
        b = { fg = colors.alt_text, bg = colors.primary },
        c = { fg = colors.alt_text, bg = colors.primary },
      },
    }

    -- Configure lualine
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
        lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
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

