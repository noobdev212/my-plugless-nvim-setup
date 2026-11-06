local NoobColor = {}

local palette = {
  color = {
    default = {
      red            = "#ff3d00",
      orange         = "#e58e44",
      green          = "#77b886",
      yellow         = "#f7cb92", 
      blue           = "#7689d9",
      magenta        = "#8f509d",
      cyan           = "#8fb9f4",
      black          = "#000000",
      bright_red     = "#ff6347",
      bright_orange  = "#f6aa6b",
      bright_green   = "#a3d6a5",
      bright_yellow  = "#ffe56e",
      bright_blue    = "#9eabe6",
      bright_magenta = "#b78fc2",
      bright_cyan    = "#a4c4ff",
      white          = "#ffffff",
      gutter_fg      = "#78808f",
      nontext        = "#d2d6dc",
    }
  },
  element = {
    default = {
      bg         = "#0f1c2e",
      fg         = "#e6e8ee",
      cursorline = "#1c2b3a",
      selection  = "#2e3c55",
      linenr     = "#4a5a70",
      comment    = "#7d88a1",
    }
  },
  syntax = {
    default = {
      keyword    = "#f28fad",
      Function   = "#89b4fa", 
      string     = "#f9e2af",
      constant   = "#cdd6f4",
      type       = "#cba6f7",
      number     = "#fab387",
      boolean    = "#f38ba8",
      operator   = "#94a3b8",
      variable   = "#e0def4",
    }
  },
  ui = {
    default = {
      cursor     = "#f5a97f",
      visual     = "#2e3c55",
      search     = "#f5c2e7",
      statusline = "#1e293b",
      menu_bg    = "#1a2535",
      menu_sel   = "#3b4252",
      fold       = "#3e4a5a",
      split      = "#334155",
    }
  },
  diagnostics = {
    default = {
      diag_error = "#f38ba8",
      diag_warn  = "#fab387",
      diag_info  = "#89dceb",
      diag_hint  = "#b4befe",
    }
  }
}

NoobColor.groups = function(scheme)
  if not palette.ui[scheme] then 
    scheme = "default"
  end

  return {
    Normal       = { fg = palette.element[scheme].fg, bg = palette.element[scheme].bg },
    NormalFloat  = { fg = palette.element[scheme].fg, bg = palette.ui[scheme].menu_bg },

    Comment      = { fg = palette.element[scheme].comment, italic = true },

    Keyword      = { fg = palette.syntax[scheme].keyword, bold = true },
    Statement    = { fg = palette.syntax[scheme].keyword, bold = true },
    Conditional  = { fg = palette.syntax[scheme].keyword, bold = true },
    Repeat       = { fg = palette.syntax[scheme].keyword, bold = true },

    Function     = { fg = palette.syntax[scheme].Function },
    Identifier   = { fg = palette.syntax[scheme].variable },

    Type         = { fg = palette.syntax[scheme].type },
    StorageClass = { fg = palette.syntax[scheme].type },
    Structure    = { fg = palette.syntax[scheme].type },

    String       = { fg = palette.syntax[scheme].string },
    Character    = { fg = palette.syntax[scheme].string },

    Number       = { fg = palette.syntax[scheme].number },
    Float        = { fg = palette.syntax[scheme].number },

    Boolean      = { fg = palette.syntax[scheme].boolean, bold = true },

    Constant     = { fg = palette.syntax[scheme].constant },

    Operator     = { fg = palette.syntax[scheme].operator },

    CursorLine   = { bg = palette.element[scheme].cursorline },
    CursorLineNr = { fg = palette.color[scheme].bright_yellow, bold = true },

    LineNr       = { fg = palette.element[scheme].linenr },

    Visual       = { bg = palette.ui[scheme].visual },

    Search       = {
      fg = palette.color[scheme].black,
      bg = palette.ui[scheme].search,
    },

    StatusLine = {
      fg = palette.element[scheme].fg,
      bg = palette.ui[scheme].statusline,
    },

    VertSplit = {
      fg = palette.ui[scheme].split,
    },

    Folded = {
      fg = palette.element[scheme].comment,
      bg = palette.ui[scheme].fold,
    },

    DiagnosticError = {
      fg = palette.diagnostics[scheme].diag_error,
    },

    DiagnosticWarn = {
      fg = palette.diagnostics[scheme].diag_warn,
    },

    DiagnosticInfo = {
      fg = palette.diagnostics[scheme].diag_info,
    },

    DiagnosticHint = {
      fg = palette.diagnostics[scheme].diag_hint,
    },
    ["@comment"]    = { fg = palette.element[scheme].comment, italic = true },

    ["@string"]     = { fg = palette.syntax[scheme].string },
    ["@string.escape"] = { fg = palette.color[scheme].orange },

    ["@number"]     = { fg = palette.syntax[scheme].number },
    ["@boolean"]    = { fg = palette.syntax[scheme].boolean, bold = true },

    ["@keyword"]    = { fg = palette.syntax[scheme].keyword, bold = true },

    ["@function"]   = { fg = palette.syntax[scheme].Function },
    ["@function.call"] = { fg = palette.syntax[scheme].Function },

    ["@type"]       = { fg = palette.syntax[scheme].type },
    ["@type.builtin"] = { fg = palette.color[scheme].cyan },

    ["@variable"]   = { fg = palette.syntax[scheme].variable },
    ["@constant"]   = { fg = palette.syntax[scheme].constant },

    ["@operator"]   = { fg = palette.syntax[scheme].operator },
  }
end

NoobColor.setup = function(scheme)
  local groups = NoobColor.groups(scheme)
  for group, setting in pairs(groups) do
    vim.api.nvim_set_hl(0, group, setting)
  end
end

return NoobColor
