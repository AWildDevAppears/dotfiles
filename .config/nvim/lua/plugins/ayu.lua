-- Colorscheme
-- This file sets up my color scheme
return {
    "Shatur/neovim-ayu",
    opts = {
        mirage = true,
        overrides = {
            Comment = { fg = "#F29E74" }, -- Comment color
            LineNr = { fg = "#F29E74" },
        }
    },
    config = function(_, opts)
        vim.o.background = "dark"

        local ayu = require("ayu")

        ayu.setup(opts)

        ayu.colorscheme()

        vim.cmd("colorscheme ayu-mirage")
    end
}
