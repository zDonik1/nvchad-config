return {
    filetype = {
        go = { require("formatter.filetypes.go").gofumpt, },
    },

    ["*"] = { require("formatter.filetypes.any").remove_trailing_whitespace, },
}
