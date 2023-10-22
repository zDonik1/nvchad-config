local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {
    -- webdev stuff
    b.formatting.deno_fmt.with({
        extra_args = { "--indent-width", "4" },
    }), -- choosed deno for ts/js files cuz its very fast!
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

    -- Lua
    b.formatting.stylua.with {
        extra_args = { "--column_width", "80", "--indent_type", "Spaces" }
    },

    -- cpp
    b.formatting.clang_format,

    -- toml
    b.formatting.taplo,
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = require("lsp-format").on_attach,
}
