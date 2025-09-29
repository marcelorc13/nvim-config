local M = {}

function M.create_and_open_file()
  local filename = vim.fn.input('New file name (ex: src/main.go): ')

  if filename ~= nil and filename ~= '' then
	vim.cmd('e ' .. filename)
  else
	vim.cmd('enew')
  end
end

return M
