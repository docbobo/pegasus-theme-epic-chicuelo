import QtQuick 2.6
import QtGraphicalEffects 1.12

import '../components/helpers.js' as Helpers

FocusScope {
    id: root
    clip: true
    enabled: focus
    focus: parent.focus
    readonly property alias currentGame: gamelist.currentGame


    Image {
        source: '../assets/ingame-global-bg.jpg'

        width: parent.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom    
    }
    
    Image {
        fillMode: Image.PreserveAspectFit
        height: 0.16 * root.height
        id: x_logo2
        smooth: false
        source: '../assets/logos/' + modelData.shortName + '.svg'
        visible: false
        width: 0.16 * root.width
        x: 0.553 * root.width - 0.5 * width
        y: 0.821 * root.height - 0.5 * height
    }
    Rectangle {
        anchors.fill: x_logo2
        color: '#4f5159'
        id: color_x_logo2
        visible: false
    }
    Blend {
        anchors.fill: x_logo2
        foregroundSource: color_x_logo2
        mode: 'multiply'
        source: x_logo2
    }
    Text {
        id: x_longdescription

        color: '#818181'
        elide: Text.ElideRight
        font.family: theme_font.name
        font.pixelSize: 0.02 * root.height
        height: 0.2 * root.height
        horizontalAlignment: Text.AlignLeft
        text: Helpers.lookup_description(modelData);
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        width: 0.25 * root.width
        wrapMode: Text.WordWrap
        x: 0.789 * root.width - 0.5 * width
        y: 0.821 * root.height - 0.5 * height
    }

    ListView {
        id: gamelist
        
        Keys.onPressed: if (!event.isAutoRepeat && api.keys.isAccept(event)) { event.accepted = true; currentGame.launch(); }
        clip: true
        focus: true
        height: 0.75 * root.height
        highlightMoveDuration: 0
        highlightRangeMode: ListView.ApplyRange
        model: modelData.games
        preferredHighlightBegin: height * 0.5 - highlightHeight * 0.5
        preferredHighlightEnd: preferredHighlightBegin + highlightHeight
        readonly property int highlightHeight: 0.03 * 1.5 * root.height
        readonly property var currentGame: model.get(currentIndex)
        width: 0.395 * root.width
        x: 0.07 * root.width
        y: 0.12 * root.height
        delegate: Text {
            color: ListView.isCurrentItem ? selectedColor : unselectedColor
            elide: Text.ElideRight
            
            font.family: theme_font.name
            font.pixelSize: 0.024 * root.height
            horizontalAlignment: Text.AlignLeft
            leftPadding: 0.05 * root.width
            rightPadding: leftPadding
            lineHeight: 1.7
            readonly property color selectedColor: '#78c7ef'
            readonly property color unselectedColor: '#dee0e8'
            text: modelData.title
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            width: ListView.view.width
        }
        highlight: Image {
            smooth: false
            source: '../assets/icon.png'
        }
    }

    Image {
        id: md_image
        
        cache: false

        fillMode: Image.PreserveAspectFit
        height: 0.5556 * root.height
        opacity: visible ? 1.0 : 0.0
        smooth: true
        source: currentGame.assets.boxFront
        visible: status == Image.Ready
        width: 0.4167 * root.width
        x: 0.6925 * root.width - 0.5 * width
        y: 0.3915 * root.height - 0.5 * height
    }

    DropShadow {
        anchors.fill: md_image
        horizontalOffset: 5
        verticalOffset: 5
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: md_image
    }
}