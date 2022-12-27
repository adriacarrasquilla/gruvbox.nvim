local colors = require("tokyonight.colors").setup({ transform = true })
local config = require("tokyonight.config").options

local tokyonight = {}

tokyonight.normal = {
  a = { bg = colors.blue1, fg = colors.black, gui= "bold" },
  b = { bg = colors.terminal_black, fg = colors.blue1 },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

tokyonight.insert = {
  a = { bg = colors.green, fg = colors.black , gui= "bold"},
  b = { bg = colors.terminal_black, fg = colors.green },
}

tokyonight.command = {
  a = { bg = colors.yellow, fg = colors.black , gui= "bold"},
  b = { bg = colors.terminal_black, fg = colors.yellow1 },
}

tokyonight.visual = {
  a = { bg = colors.magenta, fg = colors.black, gui= "bold" },
  b = { bg = colors.terminal_black, fg = colors.magenta },
}

tokyonight.replace = {
  a = { bg = colors.red, fg = colors.black, gui= "bold" },
  b = { bg = colors.terminal_black, fg = colors.red },
}

tokyonight.terminal = {
  a = {bg = colors.green1, fg = colors.black, gui= "bold" },
  b = {bg = colors.terminal_black, fg=colors.green1 },
}

tokyonight.inactive = {
  a = { bg = colors.bg, fg = colors.blue, gui= "bold" },
  b = { bg = colors.bg, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(tokyonight) do
    mode.a.gui = "bold"
  end
end

return tokyonight
