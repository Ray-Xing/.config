-- Markdown 快捷键
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- 普通模式快捷键
		vim.keymap.set("n", "<leader>w", "yiWi[<esc>Ea](<esc>pa)", { buffer = true })

		-- 插入模式快捷键
		local opts = { buffer = true }

		-- 通用编辑快捷键
		vim.keymap.set("i", ",g", "<Esc>/<++><CR>:nohlsearch<CR>c4l", opts)
		vim.keymap.set("i", ",f", "$$ <++><Esc>F$i", opts)
		vim.keymap.set("i", ",,F", "<Enter>$$<Enter><Enter>$$<Enter><Enter><++><Esc>3ki", opts)
		vim.keymap.set("i", ",,n", "---<Enter><Enter>", opts)
		vim.keymap.set("i", ",,b", "**** <++><Esc>F*hi", opts)
		vim.keymap.set("i", ",,s", "~~~~ <++><Esc>F~hi", opts)
		vim.keymap.set("i", ",,i", "** <++><Esc>F*i", opts)
		vim.keymap.set("i", ",,d", "`` <++><Esc>F`i", opts)
		vim.keymap.set("i", ",,c", "```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA", opts)
		vim.keymap.set("i", ",,h", "<mark><mark><Space><++><Esc>2F<i", opts)
		vim.keymap.set("i", ",,p", "![](<++>) <++><Esc>F[a", opts)
		vim.keymap.set("i", ",,a", "[](<++>) <++><Esc>F[a", opts)
		vim.keymap.set("i", ",,l", "--------<Enter>", opts)

		vim.keymap.set("i", ",1", "# <Enter><++><Esc>kA", opts)
		vim.keymap.set("i", ",2", "## <Enter><++><Esc>kA", opts)
		vim.keymap.set("i", ",3", "### <Enter><++><Esc>kA", opts)
		vim.keymap.set("i", ",4", "#### <Enter><++><Esc>kA", opts)

		-- 表格相关
		vim.keymap.set("i", ",,tj", ":--: |", opts)
		vim.keymap.set("i", ",,th", ":-- |", opts)
		vim.keymap.set("i", ",,tl", "--: |", opts)

		-- 数学公式
		vim.keymap.set("i", "^^", "^{}<++><Esc>F}i", opts)
		vim.keymap.set("i", "__", "_{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",F", "\\frac{}{<++>}<++><Esc>2F}i", opts)
		vim.keymap.set("i", ",s", "\\sqrt[]{<++>}<++><Esc>F]i", opts)
		vim.keymap.set(
			"i",
			",e",
			"<Enter>\\begin{equation}<Enter>\\begin{aligned}<Enter><Enter>\\end{aligned}<Enter>\\end{equation}<Enter><Enter><++><Esc>2ki<Tab>",
			opts
		)
		vim.keymap.set(
			"i",
			",c",
			"$$<Enter>\\begin{cases}<Enter>\\begin{aligned}<Enter><Enter>\\end{aligned}<Enter>\\end{cases}<Enter>$$<Enter><++><Esc>4ki<Tab>",
			opts
		)
		vim.keymap.set("i", ",S", "\\sum\\limits_{i=}^{<++>}<++><Esc>2F}i", opts)
		vim.keymap.set("i", ",P", "\\prod{i=}{<++>}<++><Esc>2F}i", opts)
		vim.keymap.set("i", ",p", "\\frac{\\partial }{\\partial <++>}<++><Esc>2F}i", opts)
		vim.keymap.set("i", ",i", "\\int_{}^{<++>} <++> \\mathrm{d}<++><Esc>3F}i", opts)
		vim.keymap.set("i", ",v", "\\vec{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",V", "\\overrightarrow{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",br", "\\bra{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",k", "\\ket{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",ht", "\\hat{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",hb", "\\hbar ", opts)
		vim.keymap.set("i", ",H", "i\\hbar\\frac{\\partial}{\\partial t}", opts)
		vim.keymap.set("i", ",dd", "\\mathrm{d}", opts)
		vim.keymap.set("i", ",d1", "\\dot{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",d2", "\\ddot{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",cd", "\\cdot", opts)
		vim.keymap.set("i", ",cds", "\\cdots", opts)
		vim.keymap.set("i", ",wh", "\\widehat{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",wt", "\\widetilde{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",lr", "\\langle  \\rangle <++> <Esc>F\\ 2hi", opts)
		vim.keymap.set("i", ",md", "\\mathscr{D}", opts)
		vim.keymap.set("i", ",ee", "e^{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",tl", "\\tilde{}<++><Esc>F}i", opts)
		vim.keymap.set("i", ",ba", "\\bar{}<++><Esc>F}i", opts)

		-- 希腊字母
		local greek = {
			["@al"] = "\\alpha",
			["@bt"] = "\\beta",
			["@gm"] = "\\gamma",
			["@Gm"] = "\\Gamma",
			["@dl"] = "\\delta",
			["@Dl"] = "\\Delta",
			["@ep"] = "\\epsilon",
			["@es"] = "\\varepsilon",
			["@zt"] = "\\zeta",
			["@et"] = "\\eta",
			["@th"] = "\\theta",
			["@Th"] = "\\Theta",
			["@ts"] = "\\vartheta",
			["@io"] = "\\iota",
			["@kp"] = "\\kappa",
			["@lm"] = "\\lambda",
			["@Lm"] = "\\Lambda",
			["@sg"] = "\\sigma",
			["@Sg"] = "\\Sigma",
			["@up"] = "\\upsilon",
			["@Up"] = "\\Upsilon",
			["@om"] = "\\omega",
			["@Om"] = "\\Omega",
		}
		for key, value in pairs(greek) do
			vim.keymap.set("i", key, value, opts)
		end
	end,
})
