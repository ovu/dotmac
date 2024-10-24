-- return {
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }
-- return {
--   -- add gruvbox
--   { "sainnhe/sonokai" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "sonokai",
--     },
--   },
-- }
-- return {
--   -- add gruvbox
--   { "Mofiqul/dracula.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "dracula",
--     },
--   },
-- }
-- return {
--   -- add gruvbox
--   { "Mofiqul/vscode.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "vscode",
--     },
--   },
-- }
-- return {
--   -- add gruvbox
--   { "bluz71/vim-moonfly-colors" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "moonfly",
--     },
--   },
-- }

-- return {
--   -- add gruvbox
--   { "bluz71/vim-nightfly-colors" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "nightfly",
--     },
--   },
-- }

-- Load OneDark color palette
-- local onedark_colors = {
--   black = "#282c34",
--   white = "#abb2bf",
--   red = "#e06c75",
--   green = "#98c379",
--   blue = "#61afef",
--   yellow = "#e5c07b",
--   purple = "#c678dd",
--   cyan = "#56b6c2",
--   orange = "#d19a66",
--   gray = "#5c6370",
-- }
-- -- Function to set Tree-sitter highlights for Scala
-- local function set_scala_highlights()
--   -- Only apply these highlights for Scala files
--   vim.api.nvim_set_hl(0, "@variable", { fg = onedark_colors.cyan })
--   vim.api.nvim_set_hl(0, "@function", { fg = onedark_colors.green })
--   vim.api.nvim_set_hl(0, "@keyword", { fg = onedark_colors.purple })
--   vim.api.nvim_set_hl(0, "@type", { fg = onedark_colors.yellow })
--   vim.api.nvim_set_hl(0, "@string", { fg = onedark_colors.green })
--   vim.api.nvim_set_hl(0, "@comment", { fg = onedark_colors.gray })
--   vim.api.nvim_set_hl(0, "@constant", { fg = onedark_colors.blue })
-- end

return {
  -- add gruvbox
  { "navarasu/onedark.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
      style = "darker",
    },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     -- Ensure Scala is installed for Tree-sitter
  --     opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "scala" })
  --     -- Set Scala highlights only
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "scala",
  --       callback = set_scala_highlights,
  --     })
  --   end,
  -- },
}
-- EdenEast/nightfox.nvim
-- return {
--   -- add gruvbox
--   { "EdenEast/nightfox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "nightfox",
--     },
--   },
-- }
