local M = {}

M.list = {}

function M.list.new(content)
  local self = {
    content = {}
  }
  self.content = content or {}
  setmetatable(self, { __index = M.list })
  return self
end

function M.list:for_each(action)
  for _, element in pairs(self.content) do
    action(element)
  end
end

return M
