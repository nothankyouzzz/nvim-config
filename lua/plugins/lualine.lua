local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("lualine not loaded")
  return
end

lualine.setup({
  extensions = {
    "nvim-tree",
  },
})
