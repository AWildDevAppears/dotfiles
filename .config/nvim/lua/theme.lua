require("lualine").setup({
    options = {
        theme = "ayu_mirage",
    },
})

vim.o.background = "dark"

local ayu = require("ayu")
local colors = require("ayu.colors")
colors.generate(true)

ayu.setup({
    mirage = true,
    overrides = {
        Comment = { fg = "#F29E74" }, -- Comment color
        LineNr = { fg = "#F29E74" },
    }
})

ayu.colorscheme()

vim.cmd("colorscheme ayu-mirage")
