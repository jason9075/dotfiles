local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
    return
end

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local colors = {
  green    = '#98be65',
  orange   = '#FF8800',
  red      = '#ec5f67',
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  symbols = { added = icons.git.Add, modified = icons.git.Mod, removed = icons.git.Remove }, -- changes diff symbols
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = hide_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
        return " " .. str 
    end,
}

local filetype = {
    "filetype",
    icons_enabled = false,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = icons.git.branch,
}

local location = {
    "location",
    padding = 0,
}

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local line_ratio = current_line / total_lines
    return string.format("L:%d  %.1f", total_lines, line_ratio * 100) .. "%%"
end

local nvim_gps = function()
  local gps_location = gps.get_location()
  if gps_location == "error" then
    return ""
  else
    return gps.get_location()
  end
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = process_sections {
        lualine_a = { mode },
        lualine_b = { branch, diagnostics },
        lualine_c = {
            { nvim_gps, cond = hide_in_width },
        },
        lualine_x = { "encoding", diff, filetype },
        lualine_y = { location },
        lualine_z = { progress },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})
