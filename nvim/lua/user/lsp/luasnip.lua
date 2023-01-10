local snip_status_ok, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if not snip_status_ok then
  print("luasnip not founded.")
  return
end

luasnip.lazy_load()

-- Example
--[[ luasnip.lazy_load({paths="/path/to/package.json/folder"}) ]]

luasnip.lazy_load({ paths = "~/dotfiles/nvim/snippets" })
