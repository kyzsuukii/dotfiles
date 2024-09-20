local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

config.font = wezterm.font {
  family = 'CaskaydiaMono NF',
}

config.font_size = 15

-- config.color_scheme = 'Afterglow (Gogh)'

config.color_scheme = 'Brogrammer'

-- config.colors = {
--   foreground = "#ffffff",
--   background = "#16181a",
--
--   cursor_bg = "#ffffff",
--   cursor_fg = "#16181a",
--   cursor_border = "#ffffff",
--
--   selection_fg = "#ffffff",
--   selection_bg = "#3c4048",
--
--   scrollbar_thumb = "#16181a",
--   split = "#16181a",
--
--   ansi = { "#16181a", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
--   brights = { "#3c4048", "#ff6e5e", "#5eff6c", "#f1ff5e", "#5ea1ff", "#bd5eff", "#5ef1ff", "#ffffff" },
--   indexed = { [16] = "#ffbd5e", [17] = "#ff6e5e" },
-- }

config.window_background_opacity = 0.95

config.window_decorations = 'RESIZE'

config.tab_bar_at_bottom = true

config.window_frame = {
  font = wezterm.font({ family = 'Fira Mono', weight = 'Bold' }),
  font_size = 11,
}

config.colors = {
  selection_fg = "none",
  selection_bg = "rgba:25% 25% 25% 25%",
}

wezterm.on('update-right-status', function(window)
  local color_scheme = window:effective_config().resolved_palette
  local bg = color_scheme.background
  local fg = color_scheme.foreground

  window:set_right_status(wezterm.format({
      { Foreground = { Color = bg } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = bg } },
      { Foreground = { Color = fg } },
      { Text = ' ' .. wezterm.hostname() .. ' ' }
    }) ..
    wezterm.format({
      { Background = { Color = bg } },
      { Foreground = { Color = '#2e2e2e' } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = '#2e2e2e' } },
      { Foreground = { Color = fg } },
      { Text = ' ' .. os.date('%H:%M:%S') .. ' ' }
    }) ..
    wezterm.format({
      { Background = { Color = '#2e2e2e' } },
      { Foreground = { Color = bg } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = bg } },
      { Foreground = { Color = fg } },
      { Text = ' ' .. os.date('%Y-%m-%d') .. ' ' }
    }))
end)

config.use_fancy_tab_bar = false

return config
