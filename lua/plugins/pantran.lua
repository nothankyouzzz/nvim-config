local which_key = require("which-key")
local pantran = require("pantran")

pantran.setup({
  default_engine = "google",
  engines = {
    default_target = "zh-CN",
  },
})

which_key.register({
  ["t"] = { pantran.motion_translate , "Pantran", noremap = true, expr = true },
}, { mode = "x" })
