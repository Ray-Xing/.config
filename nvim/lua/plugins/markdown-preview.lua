return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install",
		config = function()
			-- Markdown-preview configuration
			vim.g.mkdp_theme = "light"
			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_command_for_global = 1
			vim.g.mkdp_open_to_the_world = 1
			vim.g.mkdp_browser = "firefox"
			-- vim.g.mkdp_port = ''
			-- set to 1, echo preview page url in command line when open preview page
			-- default is 0
			-- vim.g.mkdp_echo_preview_url = 1
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 1,
				toc = {},
			}
			vim.g.mkdp_page_title = "「${name}」"
			vim.g.mkdp_filetypes = { "markdown" }

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.keymap.set("n", "r", ":MarkdownPreview<CR>", { buffer = true, silent = true })
				end,
			})
		end,
	},
}
