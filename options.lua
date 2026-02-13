-- ===== Indent / Tabs (native) =====
vim.opt.expandtab = true      -- spaces > tabs
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.tabstop = 2           -- display width of a tab
vim.opt.shiftwidth = 2        -- << and >> size
vim.opt.softtabstop = 2       -- <Tab> inserts this many spaces

-- Nice behavior
vim.opt.shiftround = true     -- round indent to multiples of shiftwidth
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true


vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "javascript", "typescript", "json", "html", "css", "python", "bash" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

