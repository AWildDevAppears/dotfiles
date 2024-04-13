local binds = require("keybinds")

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            binds.jump_normal,
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Jump",
        },
        {
            binds.jump_treesitter,
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter()
            end,
            desc = "Jump - Treesitter",
        },
    },
}
