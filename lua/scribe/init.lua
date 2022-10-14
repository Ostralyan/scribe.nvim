local M = {}
local cfg = {}

M.setup = function(user_cfg)
  local default_cfg = {
    file_ext = 'md',
    directory = '~/notes/',
    default_file = 'scribe',
  }

  -- Override setup args with arguments passed by the user
  cfg = default_cfg
  cfg = vim.tbl_extend("force", default_cfg, user_cfg)

  if cfg['file_ext']:sub(1, 1) ~= '.' then
    cfg['file_ext'] = '.' .. cfg['file_ext']
  end
end

M.open = function(file_name)
  if file_name == nil then
    file_name = cfg['default_file']
  end
  vim.cmd('e ' .. cfg['directory'] .. file_name .. cfg['file_ext'])
end

M.find = function()
	require("telescope.builtin").find_files({
		prompt_title = " Find Notes",
		path_display = { "smart" },
		cwd = cfg['directory'],
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

M.get_config = function()

end

return M
