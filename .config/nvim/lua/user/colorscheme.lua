-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]
local colorscheme = "darkplus"

-- vim.api.nvim_set_var('gruvbox_material_palette', 'material')
-- vim.api.nvim_set_var('gruvbox_material_background', 'hard')

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
