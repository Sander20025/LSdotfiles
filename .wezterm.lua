local wezterm = require("wezterm")

return {
  -- Font configuration
  font_size = 17,
  font = wezterm.font("MesloLGS Nerd Font Mono"),
  line_height = 1.2,

  -- Enable the tab bar and place it at the bottom
  enable_tab_bar = true,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = true,
  -- Window appearance settings
  window_decorations = "RESIZE",
  window_background_opacity = 0.18,
  macos_window_background_blur = 56,

  colors = {
    foreground = "#CBE0F0",
    background = "#111111",
    cursor_bg = "#47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  },

  -- Window padding
  window_padding = {
    left = 25,
    right = 0,
    top = 25,
    bottom = 15,
  },

  enable_scroll_bar = false,
  default_cursor_style = "BlinkingBar",

  -- Scrollback settings
  scrollback_lines = 5000,

  -- Key bindings for actions
  keys = {
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
    { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },

    -- Split window vertically
    { key = "h", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

    -- Split window horizontally
    { key = "v", mods = "CMD|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

    -- Close the current window/pane
    { key = "y", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

    -- Insert special characters
    { key = "I", mods = "CMD|SHIFT", action = wezterm.action.SendString("|") },
    { key = "P", mods = "CMD|SHIFT", action = wezterm.action.SendString("~") },
    { key = "U", mods = "CMD|SHIFT", action = wezterm.action.SendString("{") },
    { key = "O", mods = "CMD|SHIFT", action = wezterm.action.SendString("}") },

    -- Move to the beginning of the line (Control + A)
    { key = "a", mods = "CMD", action = wezterm.action.SendString("\x01") }, -- Control + A

    -- Move to the end of the line (Control + E)
    { key = "e", mods = "CMD", action = wezterm.action.SendString("\x05") }, -- Control + E

    -- Clear the entire line
    {
      key = "Backspace",
      mods = "CMD|SHIFT",
      action = wezterm.action.Multiple({
        wezterm.action.SendString("\x15"), -- Ctrl + U to clear everything before the cursor
        wezterm.action.SendString("\x0b"), -- Ctrl + K to clear everything after the cursor
      }),
    },

    -- Toggle fullscreen
    { key = "Enter", mods = "CMD|SHIFT", action = "ToggleFullScreen" },

    -- Create a new terminal tab
    { key = "n", mods = "CMD|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },

    -- Switch between tabs
    { key = "RightArrow", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
    { key = "LeftArrow", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

    -- Move between panes
    { key = "LeftArrow", mods = "OPT|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "OPT|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "OPT|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "OPT|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
  },
}
