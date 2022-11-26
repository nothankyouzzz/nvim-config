local builtin = require("telescope.builtin")
local which_key = require("which-key")

which_key.register({
  name = "Telescope",
  f = { builtin.find_files, "Find Files" },
  l = { builtin.live_grep, "Live Grep" },
  b = { builtin.buffers, "Buffers" },
  h = { builtin.help_tags, "Help Tags" },
}, {
  prefix = "<leader>t",
})
