return {
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({
        preserve_cursor_position = { enabled = true },
        highlight = { on_put = false, on_yank = false },
      })
    end,
  },
}
