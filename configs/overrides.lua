local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
    },
    indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
    },
}

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",

        -- c/cpp stuff
        "clangd",
        "clang-format",

        -- go
        "gopls",
        "go-debug-adapter",
    },
}

-- git support in nvimtree
M.nvimtree = {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },

    git = {
        enable = true,
        ignore = false,
    },

    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
}

M.telescope = {
    pickers = {
        find_files = {
            no_ignore = true,
            hidden = true,
        },
        live_grep = {
            additional_args = {
                "--no-ignore",
                "--hidden",
                "--glob=!.git",
            },
        },
    }
}

return M
