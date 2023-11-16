require("mason").setup({
})

require("mason-lspconfig").setup({
    automatic_installation = true
})


local servers = {
    -- Lua
    "lua_ls",

    -- Rust
    "rust_analyzer",

    -- C
    "clangd",

    -- CSS
    "cssls",
    "cssmodules_ls",
    "emmet_ls",

    -- HTML
    "html",

    -- JS
    "jsonls",
    "tsserver",

    -- Vue
    "volar",

    -- Markdown
    "zk",

    -- Python
    "pyright",

    -- TOML
    "taplo",
}

-- Neodev
require("neodev").setup({

})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local map = vim.keymap.set
local on_attach = function(_, buffer)
    local bufopts = { noremap = true, silent = true, buffer = buffer }
    map("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
    map("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
    map("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    map("n", "<leader>gr", vim.lsp.buf.rename, bufopts)
end

-- Setup LSPconfigi
local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
    if lsp == "lua_ls" then
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    }
                }
            },
        })
    else
        lspconfig[lsp].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
end

-- Setup Luasnip VSCode integration
require("luasnip.loaders.from_vscode").lazy_load()

-- CMP

local luasnip = require("luasnip")

local cmp = require "cmp"

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            {
                "i",
                "s"
            }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
            {
                "i",
                "s"
            }),
    }),
    sources = {
        {
            name = "nvim_lsp"
        },
        {
            name = "nvim_lua"
        },
        {
            name = "luasnip"
        },
        {
            name = "buffer"
        },
        {
            name = "path"
        },
    },
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)
