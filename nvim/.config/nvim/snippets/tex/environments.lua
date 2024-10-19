return {
	s(
		{
			trig = "mk",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		fmta(
			[[
				$<>$ <>
			]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		{
			trig = "dk",
			dscr = "inline math",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		fmta(
			[[
				\[
					<>
				\]
				<>
			]],
			{
				i(1),
				i(0),
			}
		)
	),
	s(
		{
			trig = "beg",
			dscr = "general environment snippet",
			regTrig = false,
			wordTrig = true,
			priority = 100,
			snippetType = "snippet"
		},
		fmta(
			[[
				\begin{<>}
					<>
				\end{<>}
				<>
			]],
			{
				i(1),
				i(2),
				rep(1),
				i(0),
			}
		)
	),
}
