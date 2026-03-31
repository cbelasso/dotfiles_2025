return {
  "akinsho/bufferline.nvim",
  keys = {

    { "<leader>br", false },
    { "<leader>bl", false },
    { "<leader>bo", false },

    { "<leader>to", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>tr", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>tl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
  },
}
