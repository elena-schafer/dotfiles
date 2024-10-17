export function calendar(monitor = 0) {
	
	const cal = Widget.Calendar({
		class_name: "calendar",
		showDayNames: true,
		showDetails: false,
		showHeading: true,
		showWeekNumbers: true,
	})

  return Widget.Window({
    monitor,
			name: `cal${monitor}`,
			class_name: "calWindow",
			anchor: ["bottom", "right"],
			margins: [0,18,40,0],
			visible: false,
			child: cal,
	})
}
