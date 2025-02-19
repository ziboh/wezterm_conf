local wezterm = require('wezterm')

-- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614

local nf = wezterm.nerdfonts

local GLYPH_SEMI_CIRCLE_LEFT = nf.ple_left_half_circle_thick --[[ '' ]]
local GLYPH_SEMI_CIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[ '' ]]
local GLYPH_ADMIN = nf.md_shield_half_full --[[ '󰞀' ]]

local M = {}

local __cells__ = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

-- stylua: ignore
local colors = {
   default   = { bg = '#45475a', fg = '#1c1b19' },
   is_active = { bg = '#7FB4CA', fg = '#11111b' },
   hover     = { bg = '#587d8c', fg = '#1c1b19' },
}

local _set_process_name = function(s)
   local a = string.gsub(s, '(.*[/\\])(.*)', '%2')
   return a:gsub('%.exe$', '')
end

local _set_title = function(process_name, base_title, max_width, inset)
   local title
   inset = inset or 4

   if process_name:len() > 0 then
      title = '[' .. process_name .. '] ' .. base_title
   else
      title = base_title
   end

   if title:len() > max_width - inset then
      local diff = title:len() - max_width + inset
      title = wezterm.truncate_right(title, title:len() - diff)
   end

   return title
end

local _check_if_admin = function(p)
   if p:match('^Administrator: ') then
      return true
   end
   return false
end

---@param fg string
---@param bg string
---@param attribute table
---@param text string
local _push = function(bg, fg, attribute, text)
   table.insert(__cells__, { Background = { Color = bg } })
   table.insert(__cells__, { Foreground = { Color = fg } })
   table.insert(__cells__, { Attribute = attribute })
   table.insert(__cells__, { Text = text })
end

local simplify_process_name = function(process_name)
   local name_table = {
      wslhost = 'wsl',
      ['mosh-client'] = 'mosh',
   }

   local new_name = name_table[process_name]
   if new_name ~= nil then
      return new_name
   else
      return process_name
   end
end

local simplify_title = function(title)
   local new_title = title:match('%s*%[[^]]+%]%s*(.*)')
   if new_title == nil then
      return title
   else
      return new_title
   end
end

M.setup = function()
   wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, hover, max_width)
      __cells__ = {}
      local bg
      local fg
      local process_name = _set_process_name(tab.active_pane.foreground_process_name)
      process_name = simplify_process_name(process_name)
      local is_admin = _check_if_admin(tab.active_pane.title)

      local title = simplify_title(tab.active_pane.title)
      title = _set_title(process_name, title, max_width, (is_admin and 8))

      -- local title = _set_process_name(tab.active_pane.tty_name)
      if tab.is_active then
         bg = colors.is_active.bg
         fg = colors.is_active.fg
      elseif hover then
         bg = colors.hover.bg
         fg = colors.hover.fg
      else
         bg = colors.default.bg
         fg = colors.default.fg
      end

      -- Left semi-circle
      _push('rgba(0, 0, 0, 0.4)', bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_LEFT)

      -- Admin Icon
      if is_admin then
         _push(bg, fg, { Intensity = 'Bold' }, ' ' .. GLYPH_ADMIN)
      end

      -- Title
      _push(bg, fg, { Intensity = 'Bold' }, ' ' .. title)

      -- Right padding
      _push(bg, fg, { Intensity = 'Bold' }, ' ')

      -- Right semi-circle
      _push('rgba(0, 0, 0, 0.4)', bg, { Intensity = 'Bold' }, GLYPH_SEMI_CIRCLE_RIGHT)

      return __cells__
   end)
end

return M
