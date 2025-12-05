---@diagnostic disable: undefined-global
local M = {}

function M.setup(opts)
  opts = opts or {}
end

function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "ember"

  local p = require("ember.palette").colors

  local highlights = {
    ---------------------------------------------------------------------------
    -- Syntax (traditional vim)
    ---------------------------------------------------------------------------
    Constant = { fg = p.red },
    String = { fg = p.green },
    Number = { fg = p.red },
    Boolean = { fg = p.red },
    Float = { fg = p.red },

    Identifier = { fg = p.fg },
    Function = { fg = p.yellow },

    Statement = { fg = p.orange },
    Keyword = { fg = p.orange },
    Conditional = { fg = p.orange },
    Repeat = { fg = p.orange },
    Operator = { fg = p.fg_dim },

    Type = { fg = p.blue },
    StorageClass = { fg = p.orange },
    Structure = { fg = p.blue },

    Special = { fg = p.orange },
    Delimiter = { fg = p.fg_dim },

    ---------------------------------------------------------------------------
    -- Treesitter
    ---------------------------------------------------------------------------
    ["@variable"] = { fg = p.fg },
    ["@variable.builtin"] = { fg = p.red },
    ["@variable.parameter"] = { fg = p.fg },
    ["@variable.member"] = { fg = p.fg },

    ["@constant"] = { fg = p.red },
    ["@constant.builtin"] = { fg = p.red },

    ["@string"] = { fg = p.green },
    ["@number"] = { fg = p.red },
    ["@number.float"] = { fg = p.red },
    ["@boolean"] = { fg = p.red },

    ["@function"] = { fg = p.yellow },
    ["@function.builtin"] = { fg = p.yellow },
    ["@function.call"] = { fg = p.yellow },
    ["@function.method"] = { fg = p.yellow },
    ["@function.method.call"] = { fg = p.yellow },

    ["@constructor"] = { fg = p.red },

    ["@keyword"] = { fg = p.orange },
    ["@keyword.function"] = { fg = p.orange },
    ["@keyword.return"] = { fg = p.orange },
    ["@keyword.operator"] = { fg = p.orange },
    ["@keyword.import"] = { fg = p.orange },
    ["@keyword.conditional"] = { fg = p.orange },
    ["@keyword.repeat"] = { fg = p.orange },

    ["@type"] = { fg = p.blue },
    ["@type.builtin"] = { fg = p.blue },

    ["@property"] = { fg = p.tan },
    ["@attribute"] = { fg = p.orange },

    ["@operator"] = { fg = p.fg_dim },
    ["@punctuation"] = { fg = p.fg_dim },
    ["@punctuation.bracket"] = { fg = p.fg_dim },
    ["@punctuation.delimiter"] = { fg = p.fg_dim },

    ["@comment"] = { fg = p.comment, italic = true },

    -- Language-specific overrides
    ["@constructor.lua"] = { fg = p.fg_dim },

    ---------------------------------------------------------------------------
    -- Editor
    ---------------------------------------------------------------------------
    Normal = { fg = p.fg, bg = p.bg },
    NonText = { fg = p.comment },
    Comment = { fg = p.comment, italic = true },
    CursorLine = { bg = p.bg2 },
    CursorLineNr = { fg = p.fg },
    LineNr = { fg = p.comment },
    SignColumn = { fg = p.comment },
    Title = { fg = p.fg },
    Visual = { bg = p.bg3 },
    Search = { fg = p.bg, bg = p.yellow },
    IncSearch = { fg = p.bg, bg = p.orange },
    MatchParen = { fg = p.yellow, bg = p.bg },

    -- Status line
    StatusLine = { fg = p.fg, bg = p.bg1 },
    StatusLineNC = { fg = p.fg_dim, bg = p.bg1 },

    -- Floating windows
    NormalFloat = { fg = p.fg, bg = p.bg },
    FloatBorder = { fg = p.tan, bg = p.bg },
    WinSeparator = { fg = p.tan },

    -- Popup menu
    Pmenu = { fg = p.fg, bg = p.bg },
    PmenuSel = { bg = p.bg3 },
    PmenuKind = { fg = p.tan },
    PmenuKindSel = { fg = p.tan, bg = p.bg3 },
    PmenuExtra = { fg = p.fg_dim },
    PmenuExtraSel = { fg = p.fg_dim, bg = p.bg3 },
    PmenuSbar = { bg = p.bg1 },
    PmenuThumb = { bg = p.fg_dim },

    ---------------------------------------------------------------------------
    -- Diagnostics
    ---------------------------------------------------------------------------
    DiagnosticOk = { fg = p.green },
    DiagnosticHint = { fg = p.fg_dim },
    DiagnosticInfo = { fg = p.blue },
    DiagnosticWarn = { fg = p.orange },
    DiagnosticError = { fg = p.red },
    DiagnosticUnderlineOk = { sp = p.green, underline = true },
    DiagnosticUnderlineHint = { sp = p.fg_dim, underline = true },
    DiagnosticUnderlineInfo = { sp = p.blue, underline = true },
    DiagnosticUnderlineWarn = { sp = p.orange, underline = true },
    DiagnosticUnderlineError = { sp = p.red, underline = true },

    ---------------------------------------------------------------------------
    -- Git & Diff
    ---------------------------------------------------------------------------
    Added = { fg = p.git_add },
    Changed = { fg = p.git_change },
    Removed = { fg = p.git_delete },

    DiffAdd = { bg = p.bg_git_add },
    DiffChange = { bg = p.bg_git_change },
    DiffDelete = { bg = p.bg_git_delete },
    DiffText = { bg = p.bg_yellow },

    ---------------------------------------------------------------------------
    -- Plugins
    ---------------------------------------------------------------------------

    -- Telescope
    TelescopeBorder = { link = "FloatBorder" },
    TelescopeTitle = { link = "Title" },

    -- Lazy
    LazyBackdrop = { bg = p.bg },
    LazyButton = { bg = p.bg },
    LazyButtonActive = { fg = p.yellow, bg = p.bg },
    LazyH1 = { fg = p.yellow, bg = p.bg },
    LazyProp = { bg = p.bg },

    -- Neogit: status
    NeogitBranch = { fg = p.yellow },
    NeogitBranchHead = { fg = p.yellow, bold = true },
    NeogitRemote = { fg = p.green },
    NeogitObjectId = { fg = p.orange },
    NeogitStash = { fg = p.tan },
    NeogitFold = { fg = p.comment },
    NeogitRebaseDone = { fg = p.green },
    NeogitTagName = { fg = p.yellow },
    NeogitTagDistance = { fg = p.fg_dim },
    NeogitStatusHEAD = { fg = p.fg },
    NeogitSectionHeader = { fg = p.tan, bold = true },
    NeogitSectionHeaderCount = { fg = p.fg_dim },

    -- Neogit: file changes
    NeogitChangeModified = { fg = p.git_change },
    NeogitChangeAdded = { fg = p.git_add },
    NeogitChangeDeleted = { fg = p.git_delete },
    NeogitChangeRenamed = { fg = p.git_change },
    NeogitChangeUpdated = { fg = p.git_change },
    NeogitChangeCopied = { fg = p.git_add },
    NeogitChangeNewFile = { fg = p.git_add },
    NeogitChangeUnmerged = { fg = p.git_delete },

    -- Neogit: diff
    NeogitDiffContext = { bg = p.bg },
    NeogitDiffAdd = { fg = p.git_add, bg = p.bg_git_add },
    NeogitDiffDelete = { fg = p.git_delete, bg = p.bg_git_delete },
    NeogitDiffHeader = { fg = p.tan, bg = p.bg1, bold = true },
    NeogitHunkHeader = { fg = p.fg, bg = p.bg2 },
    NeogitActiveItem = { bg = p.bg3 },

    -- Neogit: diff highlighted
    NeogitDiffContextHighlight = { bg = p.bg1 },
    NeogitDiffAddHighlight = { fg = p.git_add, bg = p.bg_git_add },
    NeogitDiffDeleteHighlight = { fg = p.git_delete, bg = p.bg_git_delete },
    NeogitDiffHeaderHighlight = { fg = p.tan, bg = p.bg2, bold = true },
    NeogitHunkHeaderHighlight = { fg = p.fg, bg = p.bg3 },

    -- Neogit: diff cursor
    NeogitDiffContextCursor = { bg = p.bg2 },
    NeogitDiffAddCursor = { fg = p.git_add, bg = p.line_git_add },
    NeogitDiffDeleteCursor = { fg = p.git_delete, bg = p.line_git_delete },
    NeogitDiffHeaderCursor = { fg = p.tan, bg = p.bg3, bold = true },
    NeogitHunkHeaderCursor = { fg = p.fg, bg = p.bg3 },

    -- Neogit: commit/log
    NeogitFilePath = { fg = p.blue },
    NeogitCommitViewHeader = { fg = p.tan, bold = true },
    NeogitGraphAuthor = { fg = p.tan },

    -- Neogit: graph
    NeogitGraphRed = { fg = p.red },
    NeogitGraphOrange = { fg = p.orange },
    NeogitGraphYellow = { fg = p.yellow },
    NeogitGraphGreen = { fg = p.green },
    NeogitGraphBlue = { fg = p.blue },
    NeogitGraphPurple = { fg = p.tan },
    NeogitGraphCyan = { fg = p.blue },
    NeogitGraphWhite = { fg = p.fg },
    NeogitGraphGray = { fg = p.fg_dim },
    NeogitGraphBlack = { fg = p.comment },
    NeogitGraphBoldRed = { fg = p.red, bold = true },
    NeogitGraphBoldOrange = { fg = p.orange, bold = true },
    NeogitGraphBoldYellow = { fg = p.yellow, bold = true },
    NeogitGraphBoldGreen = { fg = p.green, bold = true },
    NeogitGraphBoldBlue = { fg = p.blue, bold = true },
    NeogitGraphBoldPurple = { fg = p.tan, bold = true },
    NeogitGraphBoldCyan = { fg = p.blue, bold = true },
    NeogitGraphBoldWhite = { fg = p.fg, bold = true },
    NeogitGraphBoldGray = { fg = p.fg_dim, bold = true },
    NeogitGraphBoldBlack = { fg = p.comment, bold = true },

    -- Neogit: popups
    NeogitPopupSectionTitle = { fg = p.tan, bold = true },
    NeogitPopupBranchName = { fg = p.yellow, bold = true },
    NeogitPopupBold = { bold = true },
    NeogitPopupSwitchKey = { fg = p.orange },
    NeogitPopupSwitchEnabled = { fg = p.green },
    NeogitPopupSwitchDisabled = { fg = p.fg_dim },
    NeogitPopupOptionKey = { fg = p.orange },
    NeogitPopupOptionEnabled = { fg = p.green },
    NeogitPopupOptionDisabled = { fg = p.fg_dim },
    NeogitPopupConfigKey = { fg = p.orange },
    NeogitPopupConfigEnabled = { fg = p.green },
    NeogitPopupConfigDisabled = { fg = p.fg_dim },
    NeogitPopupActionKey = { fg = p.yellow },
    NeogitPopupActionDisabled = { fg = p.comment },

    -- Neogit: misc
    NeogitCommandText = { fg = p.fg },
    NeogitCommandTime = { fg = p.fg_dim },
    NeogitCommandCodeNormal = { fg = p.git_add },
    NeogitCommandCodeError = { fg = p.git_delete },
    NeogitFloatHeader = { fg = p.fg, bg = p.bg1 },
    NeogitFloatHeaderHighlight = { fg = p.yellow, bg = p.bg1 },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
