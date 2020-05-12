import QtQuick 2.0
import QtQuick.Window 2.2

FocusScope {
	id: root

	property var currentGame: null

    property alias model: systemAxis.model
    property alias currentIndex: systemAxis.currentIndex

	signal launch()
    signal leave()
    Keys.onPressed: {
        if (!event.isAutoRepeat && api.keys.isCancel(event)) {
            event.accepted = true;
            return root.leave();
        }
    }

	Carousel {
		id: systemAxis
		focus: true
		anchors.fill: parent
		itemWidth: width
		delegate: GameDetails {
			width: systemAxis.width
			height: systemAxis.height
    	}

		onItemSelected: {
			root.currentGame = currentGame
			root.launch()
		}
  	}
}