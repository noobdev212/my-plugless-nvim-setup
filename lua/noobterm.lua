local NoobTerm = {}

NoobTerm.setup = function(config)
  _G.NoobTerm = NoobTerm

  vim.o.showtabline = 0

  if next(config) ~= null then
    NoobTerm.config = config 
  else
    NoobTerm.config = {
      tab_id  = -1 -- prevent issues when closing
    }
  end
end

NoobTerm.toggle = function()
  vim.cmd('tabnew | terminal') 
  NoobTerm.config.tab_id = vim.api.nvim_get_current_buf()
  --- wait for terminal to open
  vim.schedule(function()
    --- change to insert mode to
    --- continuously input to cmd
    vim.cmd('startinsert')
    NoobTerm.input()
  end)
end

NoobTerm.input = function()
  vim.ui.input({ 
    prompt = "Enter Command (type 'exit' or 'quit' to stop): "}, 
    function(input)
      --- check user is done with cmd 
      if input == nil or input == 'exit' or input == 'quit' then
        vim.print('Exiting terminal')
        vim.cmd('q | bd! ' .. NoobTerm.config.tab_id) 
	return
      end

      --- execute the command
      vim.print('Executing Command: ' .. input)
      vim.api.nvim_input(input .. '<CR>')

      vim.defer_fn(function()
	NoobTerm.input()
      end, 20)
  end)
end

return NoobTerm
