local luasnip = require("luasnip.loaders.from_vscode")

luasnip.lazy_load()

-- Example
--[[ luasnip.lazy_load({paths="/path/to/package.json/folder"}) ]]
luasnip.lazy_load({ paths = "~/dotfiles/nvim/snippets" })
