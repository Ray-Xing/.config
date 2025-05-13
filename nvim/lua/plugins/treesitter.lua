return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"regex",
			"terraform",
			"sql",
			"dockerfile",
			"toml",
			"json",
			"java",
			"groovy",
			"go",
			"gitignore",
			"graphql",
			"yaml",
			"make",
			"cmake",
			"markdown",
			"markdown_inline",
			"bash",
			"tsx",
			"css",
			"html",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- 添加 tex 到禁用列表
			disable = { "tex" }, -- 关键修改：禁用 tex 文件的高亮
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	},
	-- 添加这个配置确保 Treesitter 其他功能正常工作
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		-- 确保 Treesitter 其他模块对 tex 文件仍然有效
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function()
				-- 禁用高亮但保持其他功能
				require("nvim-treesitter.highlight").detach(0)
			end,
		})
	end,
}
