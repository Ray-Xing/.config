local M = {}

-- 检查 fcitx5-remote 是否可用
local function is_fcitx5_available()
	local handle = io.popen("which fcitx5-remote 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()
		return result ~= ""
	end
	return false
end

-- 保存当前输入法状态
local function save_state()
	local handle = io.popen("fcitx5-remote")
	if handle then
		local result = handle:read("*a")
		handle:close()
		-- 2是中文状态，1是英文状态
		vim.g.fcitx_prev_state = tonumber(result) == 2 and 2 or 1
	end
end

-- 切换到英文输入法
local function set_en()
	os.execute("fcitx5-remote -c")
end

-- 恢复之前保存的输入法状态
local function restore_state()
	if vim.g.fcitx_prev_state == 2 then
		os.execute("fcitx5-remote -o")
	else
		os.execute("fcitx5-remote -c")
	end
end

function M.setup()
	if not is_fcitx5_available() then
		vim.notify("fcitx5-remote not found, fcitx5 integration will not work", vim.log.levels.WARN)
		return
	end

	-- 初始化时切换到英文
	set_en()

	-- 设置自动命令
	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		pattern = { "*" },
		callback = function()
			save_state()
			set_en()
		end,
	})

	vim.api.nvim_create_autocmd({ "InsertEnter" }, {
		pattern = { "*" },
		callback = function()
			restore_state()
		end,
	})

	vim.api.nvim_create_autocmd({ "VimLeave" }, {
		pattern = { "*" },
		callback = function()
			restore_state()
		end,
	})
end

return M
