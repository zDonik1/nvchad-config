---@type MappingsTable
local M = {}

M.disabled = {
    n = {
        ["<leader>wK"] = "",
        ["<leader>wk"] = "",

        ["<leader>wa"] = "",
        ["<leader>wr"] = "",
        ["<leader>wl"] = "",
    }
}

M.general = {
    n = {
        [";"] = { ":", "Enter command mode", opts = { nowait = true } },
        [":"] = { ";", "Next character match", opts = { nowait = true } },

        ["<leader>j"] = { "J", "Join lines" },

        ["H"] = { "<C-w>h", "Window left" },
        ["L"] = { "<C-w>l", "Window right" },
        ["J"] = { "<C-w>j", "Window down" },
        ["K"] = { "<C-w>k", "Window up" },

        ["<C-j>"] = { "5j", "Move down 5 lines" },
        ["<C-k>"] = { "5k", "Move up 5 lines" },

        ["<C-f>"] = { "<C-u>", "Half page down" },
        ["<C-u>"] = { "<C-f>", "Page down" },

        ["gh"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "LSP hover",
        },

        ["<leader>w"] = { "<cmd> w <CR>", "Save file", opts = { nowait = true }},

        ["<leader>v"] = { "<cmd> vs <CR>", "Vertical split" },
        ["<leader>h"] = { "<cmd> sp <CR>", "Horizontal split" },
    },
    v = {
        [">"] = { ">gv", "indent"},

        ["<C-j>"] = { "5j", "Move down 5 lines" },
        ["<C-k>"] = { "5k", "Move up 5 lines" },
    },
}

M.telescope = {
    n = {
        ["<leader>cp"] = { "<cmd> Telescope commands <CR>", "Open command palette" },
    }
}

M.whichkey = {
    n = {
        ["<leader>sK"] = {
            function()
                vim.cmd "WhichKey"
            end,
            "Which-key all keymaps",
        },
        ["<leader>sk"] = {
            function()
                local input = vim.fn.input "WhichKey: "
                vim.cmd("WhichKey " .. input)
            end,
            "Which-key query lookup",
        },
    },
}

M.lspconfig = {
    n = {
        ["<leader>sa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "Add workspace folder",
        },

        ["<leader>sr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "Remove workspace folder",
        },

        ["<leader>sl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "List workspace folders",
        },
    },
}

M.trouble = {
    n = {
        ["<leader>dt"] = { function() require("trouble").toggle() end }
    }
}

return M
