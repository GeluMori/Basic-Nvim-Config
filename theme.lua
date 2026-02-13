vim.opt.termguicolors = true
vim.opt.background = "dark"

-- 2B Glass: transparency layer
local function make_transparent()
  local groups = {
    -- Main
    "Normal",
    "NormalFloat",
    "NormalNC",
    "EndOfBuffer",

    -- Gutter/UI
    "SignColumn",
    "LineNr",
    "FoldColumn",

    -- Splits/tabs/status
    "StatusLine",
    "StatusLineNC",
    "WinSeparator",
    "VertSplit",
    "TabLine",
    "TabLineFill",
    "TabLineSel",

    -- Cursor focus (CursorLine bg will be set by scanline below)
    "CursorLineNr",

    -- Popups / completion / float borders (prevents random opaque boxes)
    "Pmenu",
    "PmenuSel",
    "PmenuSbar",
    "PmenuThumb",
    "FloatBorder",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

-- 2B Glass: ink + treesitter layer
local function apply_2b_ink()
  -- CoreText
  vim.api.nvim_set_hl(0, "Normal", { fg = "#EDE8D0" })
  vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#EDE8D0" })
  vim.api.nvim_set_hl(0, "NormalNC", { fg = "#EDE8D0" })

  -- Subtle steel separators (replaces the old deep green)
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1C2533", bg = "none" })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = "#1C2533", bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#1C2533", bg = "none" })

  -- Completion menu text (still glassy)
  vim.api.nvim_set_hl(0, "Pmenu", { fg = "#EDE8D0", bg = "none" })
  vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#EDE8D0", bg = "#1B2230" }) -- subtle grey selection

  -- 2B scanline (subtle cursorline tint)
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111722" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#EDE8D0", bg = "none" })

  -- Ink
  vim.api.nvim_set_hl(0, "Comment", { fg = "#7C879A", italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = "#A6E3D5" })
  vim.api.nvim_set_hl(0, "Number", { fg = "#D6B56D" })
  vim.api.nvim_set_hl(0, "Keyword", { fg = "#B7A6E8" }) -- muted lavender
  vim.api.nvim_set_hl(0, "Function", { fg = "#7FA8D8" })

  -- Tree-sitter (minimal + consistent)
  vim.api.nvim_set_hl(0, "@comment", { fg = "#7C879A", italic = true })
  vim.api.nvim_set_hl(0, "@string", { fg = "#A6E3D5" })
  vim.api.nvim_set_hl(0, "@number", { fg = "#D6B56D" })
  vim.api.nvim_set_hl(0, "@keyword", { fg = "#B7A6E8" })
  vim.api.nvim_set_hl(0, "@function", { fg = "#7FA8D8" })
  vim.api.nvim_set_hl(0, "@type", { fg = "#9FB8D0" })
  vim.api.nvim_set_hl(0, "@variable", { fg = "#EDE8D0" })
end

-- Apply now
make_transparent()
apply_2b_ink()

-- Re-apply whenever a colorscheme event occurs (keeps it "sticky")
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    make_transparent()
    apply_2b_ink()
  end,
})
