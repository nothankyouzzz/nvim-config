local toggleterm = require("toggleterm")
local which_key = require("which-key")
local cmd = require("core.keymap").cmd

local configs = {
  direction = "float",
}

toggleterm.setup(configs)

which_key.register({
  ["<C-t>"] = { cmd("ToggleTerm"), "Toggle Term" },
}, {
  nowait = true,
})
