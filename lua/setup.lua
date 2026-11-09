local NoobDir = require('noobdir')
local NoobTerm = require('noobterm')
local NoobColor = require('noobcolor')

NoobDir.setup({})
NoobTerm.setup({})

require('keymaps')
require('options')
require('config')

NoobColor.setup('default')
