return {
  "navarasu/onedark.nvim",
  lazy = true,
  name = "onedark",
  opts = {
    style = "deep",
    transparent = false, -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
      comments = "italic",
      keywords = "none",
      functions = "none",
      strings = "none",
      variables = "none",
    },

    -- Lualine options --
    lualine = {
      transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {
      cGreen = "#36c797",
      cBlue = "#2bd6d0",
      cRed = "#db5e30",
      -- cGreen = "#98c379"
    }, -- Override default colors
    highlights = {
      -- ["@variable.parameter.reference"] = { fg = "$green", fmt = "underline" },
      ["@variable.parameter.reference"] = { fg = "$cGreen" },
      -- ["@type.builtin"] = { fg = "$cGreen" },
      -- ["@parameter.reference"] = { fg = "$cGreen" },
      LspReferenceText = { fg = "$cGreen" },
      LspReferenceRead = { fg = "$cGreen" },
      LspReferenceWrite = { fg = "$cGreen" },
      scalaTypeOperator = { fg = "$cGreen" },
      Visual = { fmt = "bold" },
      Number = { fg = "$cBlue" },
      ["@number"] = { fg = "$cBlue" },
      ["@number.float"] = { fg = "$cBlue" },
      ["@lsp.type.number"] = { fg = "$cBlue" },
      ["@lsp.type.typeParameter"] = { fg = "$cBlue" },
      -- ["@lsp.type.parameter"] = { fg = "$cRed" },
      -- Reference = { fg = "$cGreen" },
      -- Module = { fg = "$cGreen" },
      -- IncSearch = { fg = "$green" },
    }, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true, -- use undercurl instead of underline for diagnostics
      background = true, -- use background color for virtual text
    },
  },
}
