local M = {}
local cfg = {}

M.setup = function(user_cfg)
	local default_cfg = {
		file_ext = "md",
		directory = "~/scribs/",
		default_file = "scrib",
	}

	-- Override setup args with arguments passed by the user
	cfg = default_cfg
	cfg = vim.tbl_extend("force", default_cfg, user_cfg)

	os.execute("mkdir -p " .. cfg["directory"])

	if cfg["file_ext"]:sub(1, 1) ~= "." then
		cfg["file_ext"] = "." .. cfg["file_ext"]
	end
end

M.open = function(file_name)
	if not file_name then
		file_name = cfg["default_file"]
	end
	vim.cmd("e " .. cfg["directory"] .. file_name .. cfg["file_ext"])
end

M.new = function()
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event

	local input = Input({
		position = "50%",
		size = {
			width = "25%",
		},
		border = {
			style = "rounded",
			text = {
				top = " New note ",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "> ",
		default_value = "",
		on_submit = function(value)
			M.open(value)
		end,
	})

	-- mount/open the component
	input:mount()

	-- unmount when leave buffer/window
	input:on({ event.BufLeave, event.BufWinLeave }, function()
		input:unmount()
	end)

	-- umount when esc pressed
	input:map("n", "<Esc>", function()
		input:unmount()
	end, { noremap = true })
end

M.find = function()
	require("telescope.builtin").find_files({
		prompt_title = " Find Notes",
		path_display = { "smart" },
		cwd = cfg["directory"],
	})
end

M.get_config = function()
	return cfg
end

return M
