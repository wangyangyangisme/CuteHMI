import QtQuick 2.0

//<workaround id="cutehmi_1_qml-4" target="Qt" cause="QTBUG-34418">
// Palette is a singleton.
// Singletons require explicit import to load qmldir file.
import "."
//</workaround>

Item {
    implicitWidth: 40.0
    implicitHeight: 40.0

	property Palette palette: Palette
	property ColorSet colorSet: currentStateColorSet()
	property color baseColor: colorSet.base
	property color fillColor: colorSet.fill
	property color tintColor: colorSet.tint
	property color shadeColor: colorSet.shade
	property color foregroundColor: colorSet.foreground
	property color backgroundColor: colorSet.background
	property color strokeColor: colorSet.stroke
	property color blankColor: palette.neutral.fill
	property real lineWidth: 2.0
	property bool active: false
	property bool warning: false
	property bool alarm: false

	Behavior on baseColor { ColorAnimation {} }
	Behavior on fillColor { ColorAnimation {} }
	Behavior on tintColor { ColorAnimation {} }
	Behavior on shadeColor { ColorAnimation {} }
	Behavior on foregroundColor { ColorAnimation {} }
	Behavior on backgroundColor { ColorAnimation {} }
	Behavior on strokeColor { ColorAnimation {} }

	ColorSet {
		id: warningBlink

		base: Qt.lighter(palette.warning.base)
		fill: Qt.lighter(palette.warning.fill)
		tint: Qt.lighter(palette.warning.tint)
		shade: Qt.lighter(palette.warning.shade)
		foreground: Qt.lighter(palette.warning.foreground)
		background: Qt.lighter(palette.warning.background)
		stroke: palette.warning.stroke
	}

	ColorSet {
		id: alarmBlink

		base: Qt.lighter(palette.alarm.base)
		fill: palette.alarm.stroke
		tint: palette.alarm.shade
		shade: palette.alarm.tint
		foreground: palette.alarm.background
		background: palette.alarm.foreground
		stroke: palette.alarm.fill
	}

	Timer {
		id: blinkTimer

		interval: blink ? 250 : alarm ? 250 : 1500
		running: warning || alarm
		repeat: true

		property bool blink: false

		onTriggered: blink = !blink
	}

	function currentStateColorSet() {
		return alarm ? (blinkTimer.blink ? alarmBlink : palette.alarm) :
			   warning ? (blinkTimer.blink ? warningBlink : palette.warning) :
			   active ? palette.active : palette.inactive
	}
}

//(c)MP: Copyright © 2018, Michal Policht. All rights reserved.
//(c)MP: This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
