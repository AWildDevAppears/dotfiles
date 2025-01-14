-- Colorscheme
-- This file sets up my color scheme
return {
    "Shatur/neovim-ayu",
    opts = {
        mirage = false,
        overrides = {
            Comment = { fg = "#F29E74" }, -- Comment color
            LineNr = { fg = "#F29E74" },
            NotifyBackground = { bg = "#1F2430" },
            LspInlayHint = { fg = "#707A8C" }
        }
    },
    config = function(_, opts)
        vim.o.background = "dark"

        local ayu = require("ayu")

        ayu.setup(opts)

        ayu.colorscheme()

        vim.cmd("colorscheme ayu-dark")
    end,
}
