local NoobDir = {}

NoobDir.setup = function(config) _G.NoobDir = NoobDir

  vim.g.netrw_browse_split = 0
  vim.g.netrw_banner = 0
  vim.g.netrw_liststyle = 1

  if next(config) ~= nil then
    NoobDir.config = config
  else
    NoobDir.config = {
      max_size = {
	width     = vim.api.nvim_win_get_width(0)
      },
      explorer = {
	width     = math.floor(vim.api.nvim_win_get_width(0)/3),
	is_open   = false,
	buf_id    = -1 -- file explorer buffer
      }
    }
  end
end

NoobDir.open = function()
  local _explorer = NoobDir.config.explorer
  local absolute_path = vim.api.nvim_buf_get_name(0)
  _explorer.buf_id = vim.api.nvim_get_current_buf()

  if not _explorer.is_open then
    --- Handle netrw events using callbacks
    vim.api.nvim_create_autocmd('FileType', {
      pattern  = 'netrw',
      callback = function()
	vim.cmd.stopinsert()
	NoobDir.read()
      end
    })
    vim.cmd('vnew ' .. absolute_path .. ' | Ex | vertical resize ' .. _explorer.width)
  elseif _explorer.buf_id == vim.api.nvim_get_current_buf() then
    --- delete buffer for netrw
    vim.cmd('bd ' .. _explorer.buf_id)
    _explorer.buf_id = -1
  end

  _explorer.is_open = !_explorer.is_open
end

NoobDir.read = function()
  vim.keymap.set('n', '<CR>', function()
    local buf_id    = vim.api.nvim_get_current_buf()
    local filepath  = vim.fn['netrw#Call']('NetrwFile', vim.fn['netrw#Call']('NetrwGetWord'))
    local _explorer = NoobDir.config.explorer
    local status    = vim.uv.fs_stat(filepath)
    
    --- check if it exist
    if status then
      --- open filepath if a file into prev buffer
      --- otherwise open the directory

      if status.type == 'directory' then
      	vim.print('Opening directory ' .. filepath)
      	vim.cmd("e " .. filepath)
      else
      	vim.print('Opening file ' .. filepath)
	if vim.api.nvim_buf_is_valid(_explorer.buf_id) then
	  local escape_keys = vim.api.nvim_replace_termcodes('<C-w>w', true, false, true)
  	  vim.api.nvim_feedkeys(escape_keys, 'm', false)
	end

	--- await for feedkeys to finish if valid buf id
	vim.schedule(function()
	  vim.cmd("e " .. filepath)
	end)
      end
    else
      vim.print("Path doesn't exist " .. filepath)
    end
  end, { remap = true, buffer = true })
end

return NoobDir
