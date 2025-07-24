return {
    "danymat/neogen",
    config = {
        snippet_engine = "luasnip"
    },
    keys = {
        {
            "<leader>gC",
            function ()
                require("neogen").generate()
            end
        }
    }
}
