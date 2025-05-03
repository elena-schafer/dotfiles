return {
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
	s(
		{
			trig = "cup",
			dscr = "fraction",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		t("\\cup ")
	),
	s(
		{
			trig = "cap",
			dscr = "fraction",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		t("\\cap ")
	),
}
