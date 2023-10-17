local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", { pattern = "*", command = "tabdo wincmd =", })
autocmd("BufAdd", { command = "set rnu", })
autocmd("BufWritePost", { command = "FormatWrite", })

autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.go",
    callback = function() vim.opt_local.textwidth = 100 end
})

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
