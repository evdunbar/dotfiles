require('plug')
require('nightfox')

-- Returns a table with each colorscheme and the spec associated with it
local specs require('nightfox.spec').load()

-- Returns the spec of the specified colorscheme
local spec = require('nightfox.spec').load("nightfox")

print(vim.inspect(spec.git))
-- {
--   add = "#81b29a",
--   changed = "#dbc074",
--   removed = "#c94f6d"
-- }
