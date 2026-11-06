local NoobDir = require('noobdir')
local NoobTerm = require('noobterm')
local NoobColor = require('noobcolor')

NoobDir.setup({})
NoobTerm.setup({})
NoobColor.setup('default')

require('keymaps')
require('options')
require('config')

