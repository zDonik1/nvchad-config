local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            {
                "jose-elias-alvarez/null-ls.nvim",
                config = function()
                    require "custom.configs.null-ls"
                end,
            },
            {
                "lukas-reineke/lsp-format.nvim",
            },
        },
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end, -- Override to setup mason-lspconfig
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            }
        },
        opts = vim.tbl_deep_extend("force", require("plugins.configs.telescope"), overrides.telescope),
    },

    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "tpope/vim-fugitive",
        },
    },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "bzl",
                "clang-format",
                "clangd",
                "cmake-language-server",
                "cpplint",
                "cpptools",
                "deno",
                "gdtoolkit",
                "go-debug-adapter",
                "gopls",
                "golangci-lint",
                "golangci-lint-langserver",
                "lua-language-server",
                "python-lsp-server",
                "stylua",
            }
        }
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults 
                "vim",
                "lua",

                -- web dev 
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                -- "vue", "svelte",

                -- low level
                "cpp",
                "c_sharp",
                "cmake",
                "zig",

                -- others
                "dockerfile",
                "gdscript",
                "godot_resource",
                "yaml",

                -- qml
                "qmldir",
                "qmljs",
            },
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    {
        "hrsh7th/nvim-cmp",
        opts = require("custom.configs.cmp"),
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory", },
    },

    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
}

return plugins
