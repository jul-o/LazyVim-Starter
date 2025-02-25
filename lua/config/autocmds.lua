-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/jul-o/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.html", "*.tsx", "*.jsx" },
  callback = function(_)
    vim.cmd("InlineFoldToggle")
  end,
})

vim.api.nvim_create_user_command("Redir", function(ctx)
  local lines = vim.split(vim.api.nvim_exec(ctx.args, true), "\n", { plain = true })
  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.opt_local.modified = false
end, { nargs = "+", complete = "command" })
