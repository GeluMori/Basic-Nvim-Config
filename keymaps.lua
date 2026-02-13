vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<cmd> w <cr>")

vim.keymap.set("n", "<leader>q", "<cmd> q <cr>")

vim.keymap.set("n", "<leader>t", function()
  local markers = { ".git", ".venv", "pyproject.toml", "package.json" }
  local start_dir = vim.fn.expand("%:p:h")
  if start_dir == "" then
    start_dir = vim.loop.cwd()
  end
  local found = vim.fs.find(markers, { upward = true, path = start_dir })
  local root
  if #found > 0 then
    root = vim.fs.dirname(found[1])
  else
    root = start_dir
  end
  vim.cmd("lcd " .. root)
  vim.cmd("belowright split | terminal")
end, { desc = 'Open terminal in Project Root' })
