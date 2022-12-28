local colors = require("gruvbox.colors").setup({ transform = true })
local config = require("gruvbox.config").options

local gruvbox = {}

gruvbox.normal = {
  a = { bg = colors.blue1, fg = colors.black, gui= "bold" },
  b = { bg = colors.terminal_black, fg = colors.blue1 },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

gruvbox.insert = {
  a = { bg = colors.green, fg = colors.black , gui= "bold"},
  b = { bg = colors.terminal_black, fg = colors.green },
}

gruvbox.command = {
  a = { bg = colors.yellow, fg = colors.black , gui= "bold"},
  b = { bg = colors.terminal_black, fg = colors.yellow1 },
}

gruvbox.visual = {
  a = { bg = colors.magenta, fg = colors.black, gui= "bold" },
  b = { bg = colors.terminal_black, fg = colors.magenta },
}

gruvbox.replace = {
  a = { bg = colors.red, fg = colors.black, gui= "bold" },
  b = { bg = colors.terminal_black, fg = colors.red },
}

gruvbox.terminal = {
  a = {bg = colors.green1, fg = colors.black, gui= "bold" },
  b = {bg = colors.terminal_black, fg=colors.green1 },
}

gruvbox.inactive = {
  a = { bg = colors.bg, fg = colors.blue, gui= "bold" },
  b = { bg = colors.bg, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg, fg = colors.fg_gutter },
}

if config.lualine_bold then
  for _, mode in pairs(gruvbox) do
    mode.a.gui = "bold"
  end
end

return gruvbox
