local loaded, installer = pcall(require, "mason")
if not loaded then
  print("mason not loaded")
end

local config = {
  automatic_installation = true,
  max_concurrent_installers = 12,
  ui = {
    border = "single",
  },
  pip = {
    install_args = { "--proxy", "http://localhost:7890" },
  },
}

installer.setup(config)
