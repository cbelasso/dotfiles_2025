-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme tokyonight]])
--   end,
-- }
--
--
return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.background = "dark" -- ensure dark mode
    vim.cmd([[colorscheme solarized]])
  end,
}
