return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        {
            "kevinhwang91/nvim-hlslens",
            opts = {
                build_position_cb = function(plist, _, _, _)
                    require("scrollbar.handlers.search").handler.show(plist.start_pos)
                end,
            },
            init = function()
                vim.cmd([[
                    augroup scrollbar_search_hide
                        autocmd!
                        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
                    augroup END
                ]])
            end
        },
        {
            "lewis6991/gitsigns.nvim",
            opts = {},
            init = function()
                require("scrollbar.handlers.search").setup()
                require("scrollbar.handlers.gitsigns").setup()
            end
        },
    },
    opts = {},

}
