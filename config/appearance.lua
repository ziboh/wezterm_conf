local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu_adapter')
local fonts = require('config.fonts')

return {
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),

   -- color scheme
   color_scheme = 'Gruvbox dark, medium (base16)',

   -- background
   window_background_opacity = 1.00,
   win32_system_backdrop = 'Acrylic',
   window_background_gradient = {
      colors = { '#1D261B', '#261A25' },
      -- Specifices a Linear gradient starting in the top left corner.
      orientation = { Linear = { angle = -45.0 } },
   },
   background = {
      {
         source = { File = wezterm.config_dir .. '/backdrops/space.jpg' },
      },
      {
         source = { Color = '#1A1B26' },
         height = '100%',
         width = '100%',
         opacity = 0.95,
      },
   },

   -- scrollbar
   enable_scroll_bar = true,
   min_scroll_bar_height = '3cell',

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = true,
   tab_max_width = 21,
   switch_to_last_active_tab_when_closing_tab = true,

   -- cursor
   animation_fps = 120,
   cursor_blink_ease_in = 'EaseOut',
   cursor_blink_ease_out = 'EaseOut',
   default_cursor_style = 'BlinkingBlock',
   cursor_blink_rate = 650,

   -- window
   adjust_window_size_when_changing_font_size = false,
   window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
   integrated_title_button_style = 'Windows',
   integrated_title_button_color = 'auto',
   integrated_title_button_alignment = 'Right',
   initial_cols = 120,
   initial_rows = 24,
   window_padding = {
      left = 5,
      right = 10,
      top = 12,
      bottom = 7,
   },
   window_close_confirmation = 'NeverPrompt',
   ssh_backend = 'Ssh2',
   window_frame = {
      active_titlebar_bg = '#0F2536',
      inactive_titlebar_bg = '#0F2536',
      font = fonts.font,
      font_size = fonts.font_size,
   },
   inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}
