vim.g.mapleader = " "
vim.g.maplocalleader = " "


local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

map("", "J", "5j", opt)
map("", "K", "5k", opt)
map("", "H", "^", opt)
map("", "L", "$", opt)
--map("i", "<c-p>", "<esc><c-p>a", opt)
--map("n", "<c-y>", "\"+y", opt)
--map("n", "<c-y><c-y>", "\"+yy", opt)
--map("n", "<c-p>", "\"+p", opt)
map("v", "p", '"_dP', opt)
map("n", "sq", ":q<CR>", opt)
map("n", "<leader>q", ":q!<CR>", opt)
map("n", "sw", ":w<CR>", opt)
map("n", "<leader>w", ":w ! sudo tee %<cr>", opt)
map("n", "<Leader><cr>", ":nohlsearch<cr>", opt)
map("n", "<CR>", "o<Esc>", opt)


-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "S", "", opt)
map("n", "R", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "-", ":vertical resize -10<CR>", opt)
map("n", "=", ":vertical resize +10<CR>", opt)
-- 上下比例
map("n", "+", ":resize +10<CR>", opt)
map("n", "_", ":resize -10<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "st", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o","l", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "sv", action = "vsplit" },
  { key = "sh", action = "split" },
  -- 文件操作
  { key = "x", action = "system_open" },
  { key = "u", action = "dir_up" },
  -- cd
  { key = "gg", action = "cd" },
  -- tabnew
  { key = "t", action = "tabnew" },
  -- remove
  { key = "-", action = "" },
  { key = "s", action = "" },
}


-- Telescope
-- 查找文件
-- map("n", "<c-f>", ":Telescope find_files<CR>", opt)
-- map("n", "sf", ":lua require('telescope.builtin').find_files({search_dirs={'~/','.'}})<cr>", opt)
map("n", "sf", ":Telescope find_files search_dirs={'.','~/'}<CR>", opt)
-- 全局搜索
map("n", "sgit", ":lua require('telescope.builtin').git_files()<cr>", opt)
--map("n", "sg", ":Telescope live_grep<CR>", opt)
map("n", "srg", ":Telescope live_grep<CR>", opt)



-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

return pluginKeys
