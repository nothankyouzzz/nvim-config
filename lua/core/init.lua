local M = {}

local elements = {
  "options",
}

M.setup = function()
  for _, element in pairs(elements) do
    require("core." .. element)
  end
end

return M
