return {
	s(
		{
			trig = ";a",
			dscr = "general environment snippet",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		t("\\alpha ")
	),
	s(
		{
			trig = ";b",
			dscr = "general environment snippet",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		t("\\beta ")
	),
	s(
		{
			trig = ";g",
			dscr = "general environment snippet",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		t("\\gamma ")
	),
	s(
		{
			trig = "ff",
			dscr = "fraction",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		fmta(
			"\\frac{<>}{<>} <>",
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
}
