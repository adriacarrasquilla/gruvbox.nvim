local util = require("tokyonight.util")

local M = {}

---@class Palette #504945
M.default = {
  none = "NONE",
  bg_dark = "#1d2021",
  bg = "#282828",
  bg_highlight = "#32302f",
  terminal_black = "#3c3836",
  fg = "#fbf1c7",
  fg_dark = "#ebdbb2",
  fg_gutter = "#a89984",
  dark3 = "#665c54",
  comment = "#7c6f64",
  dark5 = "#7c6f64",
  blue0 = "#83a598",
  blue = "#83a598",
  cyan = "#8ec07c",
  cyan2 = "#689d6a",
  blue1 = "#458588",
  blue2 = "#076678",
  blue5 = "#458588",
  blue6 = "#076678",
  blue7 = "#458588",
  magenta = "#d3869b",
  magenta2 = "#8f3f71",
  purple = "#d3869b",
  orange = "#fe8019",
  orange2 = "#af3a03",
  yellow = "#fabd2f",
  yellow1 = "#d79921",
  yellow3 = "#b57614",
  green = "#b8bb26",
  green1 = "#98971a",
  green2 = "#79740e",
  teal = "#427b58",
  red = "#fb4934",
  red1 = "#cc241d",
  git = { change = "#83a598", add = "#98971a", delete = "#fb4934" },
  gitSigns = {
    change = "#83a598",
    add = "#98971a",
    delete = "#fb4934",
  },
}

M.night = {
  bg = "#1a1b26",
  bg_dark = "#16161e",
}
M.day = M.night

M.moon = function()
  local ret = {
    none = "NONE",
    bg_dark = "#1e2030", --
    bg = "#222436", --
    bg_highlight = "#2f334d", --
    terminal_black = "#444a73", --
    fg = "#c8d3f5", --
    fg_dark = "#828bb8", --
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#7a88cf", --
    dark5 = "#737aa2",
    blue0 = "#3e68d7", --
    blue = "#82aaff", --
    cyan = "#86e1fc", --
    blue1 = "#65bcff", --
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#b4f9f8", --
    blue7 = "#394b70",
    purple = "#fca7ea", --
    magenta2 = "#ff007c",
    magenta = "#c099ff", --
    orange = "#ff966c", --
    yellow = "#ffc777", --
    green = "#c3e88d", --
    green1 = "#4fd6be", --
    green2 = "#41a6b5",
    teal = "#4fd6be", --
    red = "#ff757f", --
    red1 = "#c53b53", --
  }
  ret.comment = util.blend(ret.comment, ret.bg, "bb")
  ret.git = {
    change = util.blend(ret.blue, ret.bg, "ee"),
    add = util.blend(ret.green, ret.bg, "ee"),
    delete = util.blend(ret.red, ret.bg, "dd"),
  }
  ret.gitSigns = {
    change = util.blend(ret.blue, ret.bg, "66"),
    add = util.blend(ret.green, ret.bg, "66"),
    delete = util.blend(ret.red, ret.bg, "aa"),
  }
  return ret
end

---@return ColorScheme
function M.setup(opts)
  opts = opts or {}
  local config = require("tokyonight.config")

  local style = config.is_day() and config.options.light_style or config.options.style
  local palette = M[style] or {}
  if type(palette) == "function" then
    palette = palette()
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = vim.tbl_deep_extend("force", M.default, palette)

  util.bg = colors.bg
  util.day_brightness = config.options.day_brightness

  colors.diff = {
    add = util.darken(colors.green1, 0.15),
    delete = util.darken(colors.red, 0.15),
    change = util.darken(colors.blue, 0.15),
    text = colors.blue,
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.darken(colors.fg, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  -- colors.bg_popup = colors.bg_dark
  colors.bg_popup = colors.bg -- I want popups to be transparent
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
    or config.options.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = config.options.styles.floats == "transparent" and colors.none
    or config.options.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = util.darken(colors.dark3, 0.7)
  colors.bg_search = colors.orange
  colors.fg_sidebar = colors.fg_dark
  -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
  colors.fg_float = colors.fg

  colors.error = colors.red
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.cyan

  config.options.on_colors(colors)
  if opts.transform and config.is_day() then
    util.invert_colors(colors)
  end

  return colors
end

return M
