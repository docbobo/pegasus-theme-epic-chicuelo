import QtQuick 2.0
import QtQuick.Window 2.2

FocusScope {
    id: root

    property alias model: systemAxis.model
    property alias currentIndex: systemAxis.currentIndex


    signal leave()
    Keys.onPressed: {
        if (!event.isAutoRepeat && api.keys.isCancel(event)) {
            event.accepted = true;
            return root.leave();
        }
    }

    Image {
        source: '../assets/ingame-global-bg.jpg'

        width: parent.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom    
    }

  Carousel {
    id: systemAxis
    focus: true
    anchors.fill: parent
    itemWidth: width
    delegate: Loader {
      width: systemAxis.width
      height: systemAxis.height
      source: 'GameDetails.qml'
    }
  }
}