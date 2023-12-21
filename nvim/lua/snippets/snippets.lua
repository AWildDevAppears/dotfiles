local ls = require("luasnip")
local parse = ls.parser.parse_snippet

return {
    all = {
        -- Basic snippets
        parse("cpr", [[
            /**
            * Copyright (c) AWildDevAppears
            */
        ]])
        -- Advanced snippets
    },
    lua = {
        -- Basic snippets
        parse("lzret", [[
            return {
                "$1:path",
                opts = {},
            }
        ]])
        -- Advanced snippets
    },
    javascriptreact = {
        parse("prc", [[
            /**
            * Copyright (c) AWildDevAppears
            */

            export function ${TM_FILENAME}() {
                return <div>...</div>
            }
        ]])
    },
    typescriptreact = {
        parse("prc", [[
            /**
            * Copyright (c) AWildDevAppears
            */

            interface I${TM_FILENAME}Props {

            }

            export function ${TM_FILENAME}<I${TM_FILENAME}Props>() {
                return <div>...</div>
            }
        ]])
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

        ]])
    }
}
