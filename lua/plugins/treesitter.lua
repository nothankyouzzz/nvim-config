local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("treesitter not loaded")
  return
end

local configs = {
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "help" },
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
}

treesitter.setup(configs)
