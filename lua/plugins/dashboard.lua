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
}
