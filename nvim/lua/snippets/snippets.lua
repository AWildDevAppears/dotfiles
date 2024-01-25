local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
    all = {
        -- Basic snippets
        parse("cpr", [[
            /**
            * Copyright (c) AWildDevAppears
            */
        ]]),
        -- Advanced snippets
    },
    lua = {
        -- Basic snippets
        parse("lzret", [[
            return {
                "$1:path",
                opts = {},
            }
        ]]),
        parse("keybind", [[
            vim.keybind.set("%1:mode", "%2:bind", "<Cmd>%3:command<cr>")
        ]]),
        -- Advanced snippets
    },
    javascriptreact = {
        parse("prc", [[
            /**
            * Copyright (c) AWildDevAppears
            */

            export function ${TM_FILENAME_BASE}() {
                return <div>...</div>
            }
        ]]),
    },
    typescriptreact = {
        parse("prc", [[
            /**
            * Copyright (c) AWildDevAppears
            */

            interface I${TM_FILENAME_BASE}Props {

            }

            export function ${TM_FILENAME_BASE}<I${TM_FILENAME_BASE}Props>() {
                return <div>...</div>
            }
       ]]),
    },
    vue = {
        parse("vuefile", [[
            <script setup>
                import { ref } from "vue";
            </script>

            <template>
                <div>
                ...
                </div>
            </template>

            <style scoped>
                .base {

                }
            </style>

        ]]),
    },
    go = {
        parse("forrange", [[
            for $1:key, $2:value := range $3:array {
                $4"content"
            }
        ]]),
        parse("iferr", [[
            if err != nil {
                $1:panic
            }
        ]]),
    }
}
