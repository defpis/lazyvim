-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local default_im = "com.apple.keylayout.ABC"
local latest_im = default_im

function __Reset()
  latest_im = vim.fn.system("macism")
  vim.fn.system("macism " .. default_im)
end

function __Apply()
  if latest_im ~= default_im then
    vim.fn.system("macism " .. latest_im)
  end
end

vim.cmd([[ autocmd InsertLeave * lua vim.defer_fn(__Reset, 0) ]])
vim.cmd([[ autocmd InsertEnter * lua vim.defer_fn(__Apply, 0) ]])
