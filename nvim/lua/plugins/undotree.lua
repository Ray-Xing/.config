return {
  {
    "mbbill/undotree",
    keys = {
      { "su", "<cmd>UndotreeToggle<cr>", desc = "UndoTree Toggle" },
    },
    config = function()
      -- 可选的基本配置
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  }
}
