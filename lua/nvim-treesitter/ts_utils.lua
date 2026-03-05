local M = {}

function M.get_node_at_cursor(winid)
  winid = winid or 0
  local cursor = vim.api.nvim_win_get_cursor(winid)
  local pos = { cursor[1] - 1, cursor[2] }
  local ok, node = pcall(vim.treesitter.get_node, {
    bufnr = vim.api.nvim_win_get_buf(winid),
    pos = pos,
    ignore_injections = false,
  })
  if ok then
    return node
  end
  return nil
end

return M
