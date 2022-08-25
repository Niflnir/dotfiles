local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end 
luasnip.filetype_extend("typescript", {"javascript"})
require("luasnip/loaders/from_vscode").load({paths ="~/.config/nvim/lua/user/snippets/" })

