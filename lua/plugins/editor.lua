return {
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(highlights, colors) end,
    },
  },

  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    cmd = "CompetiTest",
    opts = {
      testcases_use_single_file = true,
    },
  },

  {
    "folke/edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
    },
  },
}
