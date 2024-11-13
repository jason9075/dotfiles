-- Ref: https://github.com/mireq/luasnip-snippets/tree/main
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("all", {
  s(
    { trig = "jason", descr = "Jason Kuan's test snippet." },
    fmt("Line 1 {}\nLine 2 {}\nLine 3 {}\n", { i(1, "value1"), i(2, "value2"), i(3, "value3") })
  ),
  s(
    { trig = "jasonrep", descr = "Jason Kuan's test repetition snippet." },
    fmt("origin: {},  repeat: {}, repeat again: {}", { i(1, "value"), rep(1), rep(1) })
  ),
})

ls.add_snippets("plantuml", {
  s(
    { trig = "theme", dscr = "apply my nord theme" },
    fmt(
      [[            
!theme nord-night from https://raw.githubusercontent.com/jason9075/plantuml-nord-themes/main/themes
]],
      {}
    )
  ),
  s(
    { trig = "ar", dscr = "add arrow" },
    fmta(
      [[
<A> <artype> <B>
]],
      {
        A = i(1, "from"),
        B = i(2, "to"),
        artype = c(3, { t("->"), t("-->"), t("->x"), t("-->x"), t("<->"), t("<-->") }),
      }
    )
  ),
})
