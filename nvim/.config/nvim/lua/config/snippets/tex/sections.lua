return {
	s(
		{
			trig = "#",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		fmta(
			[[ \section*{<>} <> ]],
			{ i(1), i(0), }
		)
	),
	s(
		{
			trig = "##",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 200,
			snippetType = "snippet"
		},
		fmta(
			[[ \subsection*{<>} <> ]],
			{ i(1), i(0), }
		)
	),
	s(
		{
			trig = "###",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 300,
			snippetType = "snippet"
		},
		fmta(
			[[ \subsubsection*{<>} <> ]],
			{ i(1), i(0), }
		)
	),
	s(
		{
			trig = "####",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 400,
			snippetType = "snippet"
		},
		fmta(
			[[ \paragraph*{<>} <> ]],
			{ i(1), i(0), }
		)
	),
	s(
		{
			trig = "#####",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 500,
			snippetType = "snippet"
		},
		fmta(
			[[ \subparagraph*{<>} <> ]],
			{ i(1), i(0), }
		)
	),
}
