-- Comment
-- Allows me to comment and uncomment lines and blocks
local binds = require("keybinds")

return {
    "numToStr/Comment.nvim",
    opts = {
        toggler = {
            line = binds.comment,
            block = binds.block_comment,
        }
    },
    lazy = false
}
