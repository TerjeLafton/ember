local M = {}

M.colors = {
  -- Backgrounds (dark to light)
  bg = "#0d0d0d",
  bg1 = "#141414",
  bg2 = "#1a1a1a",
  bg3 = "#2a2a2a",

  -- Foreground
  fg = "#e8e4e0",
  fg_dim = "#908c88",
  comment = "#555555",

  -- Syntax accents
  yellow = "#f0c000",
  orange = "#e88a2a",
  red = "#d44a3a",
  green = "#a9b665",
  blue = "#7aa2c7",
  tan = "#c4a87a",

  -- Git (distinct, functional colors)
  git_add = "#73c936",
  git_change = "#7aa2c7",
  git_delete = "#ff5555",

  -- Background tints
  bg_yellow = "#2d2a1a",
  bg_git_add = "#1a2e1a",
  bg_git_change = "#1a2230",
  bg_git_delete = "#2e1a1a",

  -- Cursor line variants for git
  line_git_add = "#254025",
  line_git_delete = "#402525",
}

return M
