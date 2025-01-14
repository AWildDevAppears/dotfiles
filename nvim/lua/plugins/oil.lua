return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "size",
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["<Backspace>"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, buffnr)
                local hidden = {
                    "node_modules"
                }

                for _, value in pairs(hidden) do
                   if name == value then
                        return true
                   end
                end

                return false
            end
        },
    },
    init = function()
        vim.keymap.set("n", "\\", function()
            require("oil").open()
        end)
    end
}
