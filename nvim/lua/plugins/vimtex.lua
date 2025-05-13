return {
	"lervag/vimtex",
	lazy = false,
	ft = "tex",
	init = function()
		-- 确保启用 VimTeX 的语法高亮
		vim.g.vimtex_syntax_enabled = 1
		vim.g.tex_flavor = "latex"

		-- Zathura 配置
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_zathura = {
			options = {
				"--synctex-editor-command 'nvim --headless -es --cmd \"lua require('vimtex').view('{line}', '{input}')\"'",
			},
		}
		vim.g.vimtex_view_automatic = 1
		vim.g.vimtex_view_forward_search_on_start = 1

		-- 编译引擎设置
		vim.g.vimtex_compiler_latexmk_engines = {
			_ = "-pdf",
			pdflatex = "-pdf",
			dvipdfex = "-pdfdvi",
			lualatex = "-lualatex",
			xelatex = "-xelatex",
			["context (pdftex)"] = "-pdf -pdflatex=texexec",
			["context (luatex)"] = "-pdf -pdflatex=context",
			["context (xetex)"] = "-pdf -pdflatex='texexec --xtx'",
		}

		-- 使用 latexmk 作为编译器
		vim.g.vimtex_compiler = "latexmk"
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "out", -- 编译输出到单独的 out 目录
			callback = 1,
			continuous = 1,
			executable = "latexmk",
			hooks = {},
			options = {
				"-verbose",
				"-file-line-error",
				"-shell-escape",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}

		-- 可选：增强中文支持
		vim.g.vimtex_syntax_conceal = {
			accents = 1,
			ligatures = 1,
			math_bounds = 1,
		}
		-- 编译快捷键
		vim.keymap.set("n", "r", "<cmd>VimtexCompile<cr>", { buffer = true, silent = true, desc = "Compile LaTeX" })

		-- 正向搜索 (从tex跳转到pdf)
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { buffer = true, silent = true, desc = "View PDF" })
	end,

	-- init = function()
	-- 	-- 基本配置
	-- 	vim.g.tex_flavor = "latex"
	-- 	vim.g.vimtex_texcount_custom_arg = " -ch -total"
	--
	--
	-- 	-- 查看器配置 - Zathura (推荐)
	-- 	vim.g.vimtex_view_method = "zathura"
	--
	-- 	-- 或者使用 Okular (取消注释以下配置即可使用)
	-- 	-- vim.g.vimtex_view_method = "okular"
	-- 	-- vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
	--
	-- 	-- 正向/反向搜索配置
	-- 	vim.g.vimtex_view_forward_search_on_start = true
	-- 	vim.g.vimtex_view_enabled = 1
	--
	-- 	-- Zathura 的特定配置
	-- 	vim.g.vimtex_view_zathura_sync = true
	-- 	vim.g.vimtex_view_zathura_options = "--synctex-forward @line:@{input} @pdf"
	--
	-- 	-- 快速修复配置
	-- 	vim.g.vimtex_quickfix_open_on_warning = 0
	-- 	vim.g.vimtex_quickfix_mode = 0
	--
	-- 	-- 语法隐藏配置 (可选)
	-- 	vim.g.vimtex_syntax_conceal = {
	-- 		accents = 1,
	-- 		ligatures = 1,
	-- 		math_bounds = 1,
	-- 		math_delimiters = 1,
	-- 		math_symbols = 1,
	-- 		styles = 1,
	-- 	}
	-- end,
	-- config = function()
	-- 	vim.api.nvim_create_autocmd("FileType", {
	-- 		pattern = "tex",
	-- 		callback = function()
	-- 			-- 单词计数
	-- 			vim.keymap.set(
	-- 				"n",
	-- 				"<leader>lw",
	-- 				"<cmd>VimtexCountWords!<cr><cr>",
	-- 				{ buffer = true, silent = true, desc = "Count words" }
	-- 			)
	--
	-- end,
}
