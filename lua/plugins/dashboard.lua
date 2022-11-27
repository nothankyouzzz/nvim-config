local dashboard = require("dashboard")

dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Find File",
    action = "Telescope find_files find_command=rg,--hidden,--files",
  },
  {
    icon = "  ",
    desc = "File Browser",
    action = "Telescope file_browser",
  },
  {
    icon = "  ",
    desc = "Recent File",
    action = "Telescope frecency",
  },
}

local padding = 0
local max_len = math.max(unpack(vim.tbl_map(function(entry)
  return #entry.desc
end, dashboard.custom_center)))
dashboard.custom_center = vim.tbl_map(function(entry)
  entry.desc = entry.desc .. string.rep(" ", max_len - #entry.desc + padding)
  return entry
end, dashboard.custom_center)
