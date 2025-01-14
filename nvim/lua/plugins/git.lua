return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",

        "nvim-telescope/telescope.nvim",
    },
    keys = {
        {
            "<leader>G",
            desc = "Git"
        },
        {
            "<leader>Go",
            function()
                local neogit = require("neogit")
                neogit.open()
            end,
            desc = "Git overview"
        },
    },
    config = {},
}
