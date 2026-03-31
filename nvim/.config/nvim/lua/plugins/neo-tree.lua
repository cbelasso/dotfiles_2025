return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup()
    end,
  },
  opts = {
    window = {
      mappings = {
        ["l"] = "open",
      },
    },
  },
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>ef", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>fe", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
}
