return {
    "L3MON4D3/LuaSnip",
    version = "<CurrentMajor>",
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    init = function()
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = "~/.config/nvim/snippets"
        })

        local ls = require("luasnip")

        local snippets = require("snippets/snippets")

        -- Add all of our snippets
        for key, value in pairs(snippets) do
            ls.add_snippets(key, value)
        end

        ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI",
            enable_autosnippets = true,
        })
    end,
    opts = {},
}
