require("core.helper").list.new({ "core", "plugins", "lsp" }):for_each(function(module)
  require(module):setup()
end)
