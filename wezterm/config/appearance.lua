local gpu_adapters = require('utils.gpu-adapter')

return {
  max_fps = 240,
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',
  webgpu_preferred_adapter = gpu_adapters:pick_best(),
  -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),
  -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Gl', 'Other'),
  underline_thickness = '1.5pt',

  -- cursor
  animation_fps = 240,
  cursor_blink_ease_in = 'EaseOut',
  cursor_blink_ease_out = 'EaseOut',
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 200,

  -- color scheme
  color_scheme = 'Catppuccin Mocha',

  -- scrollbar
  enable_scroll_bar = true,

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- window
  window_padding = {
    left = 4,
    right = 0,
    top = 10,
    bottom = 7.5,
  },
  adjust_window_size_when_changing_font_size = false,
  window_close_confirmation = 'NeverPrompt',
  window_frame = {
    active_titlebar_bg = '#090909',
    -- font = fonts.font,
    -- font_size = fonts.font_size,
  },
  window_decorations = 'RESIZE',
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.65,
  },
  inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
  },

  visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 250,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 250,
    target = 'CursorColor',
  },
}
