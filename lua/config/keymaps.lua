-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { silent = true, noremap = true }

local map = function(modes, lhs, rhs)
  if type(modes) == "string" then
    vim.api.nvim_set_keymap(modes, lhs, rhs, opts)
  end
  if type(modes) == "table" then
    for _, mode in pairs(modes) do
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
  end
end

function __ToogleFocus()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  local filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

  if filetype == "neo-tree" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-W>p", true, true, true), "n", false)
  else
    vim.cmd("Neotree focus reveal")
  end
end

map("n", "<tab>", "<CMD>lua __ToogleFocus()<CR>")

map("n", "∆", ":move .+1<CR>")
map("n", "˚", ":move .-2<CR>")
map("x", "∆", ":move '>+1<CR>gv-gv")
map("x", "˚", ":move '<-2<CR>gv-gv")

map({ "n", "x" }, "y", "<Plug>(YankyYank)")
map("x", "p", '"_dP')

map("n", "x", '"_x')
map("n", "X", '"_X')

map({ "n", "x" }, "d", '"_d')
map({ "n", "x" }, "D", '"_D')
map({ "n", "x" }, "c", '"_c')
map({ "n", "x" }, "C", '"_C')

map("n", "dd", '"_dd')
map("n", "cc", '"_cc')
