local _M = {}

local pl_string = require "pl.stringx"

function _M.greater_than(version, min_version)
  local ver_tab = pl_string.split(version, ".")
  local min_tab = pl_string.split(min_version, ".")

  for i = 1, #ver_tab do
    local m = tonumber(ver_tab[i]) or 0
    local n = tonumber(min_tab[i]) or 0

    if n > m then return false end
    if m > n then return true end
  end

  return true
end

return _M
