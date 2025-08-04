return {
  'echasnovski/mini.nvim',
  version = false, -- pega sempre a versão mais recente
  config = function()
	require('mini.pick').setup()

	-- Buscar arquivos no projeto
	vim.keymap.set('n', '<leader>jf', function()
	  require('mini.pick').builtin.files()
	end, { desc = 'Procurar arquivos' })

	-- Listar buffers abertos
	vim.keymap.set('n', '<leader>jc', function()
	  require('mini.pick').builtin.buffers()
	end, { desc = 'Procurar buffers' })

	-- Grep (buscar texto nos arquivos do projeto)
	vim.keymap.set('n', '<leader>ff', function()
	  require('mini.pick').builtin.grep_live()
	end, { desc = 'Grep no projeto' })
  end,
}
