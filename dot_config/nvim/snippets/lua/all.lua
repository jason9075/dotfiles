--  for debugging, you can clear all snippets by running the following command in the nvim command line:
-- require("luasnip.session.snippet_collection").clear_snippets("all")
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
		fmta(
			[[
			Line 1 <val1>
            Line 2 <val2>
            Line 3 <val3>
            Repeat 2 <val_rep>
            ]],
			{
				val1 = i(1, "value1"),
				val2 = i(2, "value2"),
				val3 = i(3, "value3"),
				val_rep = rep(2),
			}
		)
	),
	s(
		{ trig = "jasonchoice", descr = "Jason Kuan's test choice snippet." },
		fmta(
			[[
        This is a choice snippet: <ch>
        ]],
			{ ch = c(1, { t("choice1"), t("choice2"), t("choice3") }) }
		)
	),
	s(
		{ trig = "jasonfunc", descr = "Jason Kuan's test function snippet." },
		f(function()
			return os.date("cur time: %D - %H:%M:%S")
		end)
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
