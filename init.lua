local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", { pattern = "*", command = "tabdo wincmd =", })
autocmd("BufAdd", { command = "set rnu", })
autocmd("BufWritePost", { command = "FormatWrite", })

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
