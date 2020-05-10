import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

import '../utils/helpers.js' as Helpers

FocusScope {
    id: systemView

    property alias model: menu.model
    property alias currentIndex: menu.currentIndex


    signal collectionNext
    Keys.onDownPressed: systemView.collectionNext()
    
    signal collectionPrev
    Keys.onUpPressed: systemView.collectionPrev()

    signal enter()
    Keys.onPressed: {
        if (!event.isAutoRepeat && api.keys.isAccept(event)) { 
            event.accepted = true; 
            return systemView.enter(); 
        }
    }

    Image {
        source: '../assets/system-global-bg.jpg'

        width: parent.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom    
    }

    Item {
        id: menu
        property var model
        property var currentIndex
        
        x: 0.055 * parent.width
        y: 0.105 * parent.height

        width: 0.355 * parent.width
        height: 0.785 * parent.height

        Image {
            id: logoImage

            x: 0.5 * parent.width - 0.5 * width
            y: 0.4 * parent.height - 0.5 * height
            width: 0.75 * parent.width            

            
            fillMode: Image.PreserveAspectFit
            readonly property string sourceRelPath: { return 'assets/logos/' + menu.model.shortName + '.svg'; }
            smooth: true
            source: (sourceRelPath && `../${sourceRelPath}`) || ''
            
            opacity: visible ? 1.0 : 0.0
            visible: status == Image.Ready            
        }

        Rectangle {
            anchors.fill: logoImage
            color: '#4f5159'
            id: color_logoImage
            visible: false
        }

        Blend {
            anchors.fill: logoImage
            foregroundSource: color_logoImage
            mode: 'multiply'
            source: logoImage
        }    

        Text {
            id: x_shortdescription

            color: Helpers.TEXT_COLOR
            
            elide: Text.ElideRight
            font.capitalization: Font.AllUppercase
            font.family: theme_font.name
            font.pixelSize: 0.03 * systemView.height
            
            text: Helpers.lookup_summary(menu.model)
            textFormat: Text.PlainText
            wrapMode: Text.WordWrap
            
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0.15 * parent.width
            anchors.rightMargin: 0.15 * parent.width

            height: 0.2 * systemView.height
        }
    
        Text {
            id: x_longdescription

            color: Helpers.TEXT_COLOR
            elide: Text.ElideRight
            font.family: theme_font.name
            font.pixelSize: 0.02 * systemView.height
            horizontalAlignment: Text.AlignHCenter
            text: Helpers.lookup_description(menu.model);
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0.15 * parent.width
            anchors.rightMargin: 0.15 * parent.width
            
            y: parent.height - 2 * height
            height: 0.2 * systemView.height
        }  

        Text {
            id: systemInfo

            color: '#4f5159'
            elide: Text.ElideRight
            font.family: theme_font.name
            font.pixelSize: 0.025 * systemView.height
            
            lineHeight: 1.5
            text: Helpers.format_game_count(menu.model)
            textFormat: Text.PlainText
            
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            
            wrapMode: Text.WordWrap

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0.15 * parent.width
            anchors.rightMargin: 0.15 * parent.width

            y: parent.height - height
            height: 0.2 * systemView.height

            readonly property alias currentIndex: systemView.currentIndex
            onCurrentIndexChanged: {visible = false; opacity = 0.0; fadeInTimer.restart();}
            Behavior on opacity { NumberAnimation { duration: 300 } }            
        }     
    } 
 
    
    Image {
        id: x_indicator

        fillMode: Image.Stretch
        height: 0.6 * systemView.height
        opacity: visible ? 1.0 : 0.0
        smooth: true
        source: Helpers.lookup_indicator(menu.currentIndex, menu.model)
        visible: status == Image.Ready
        width: 0.006 * systemView.width
        x: 0.027 * systemView.width - 0.5 * width
        y: 0.5 * systemView.height - 0.5 * height
    }
    
    Image {
        id: x_character

        fillMode: Image.Stretch
        height: 0.86 * systemView.height
        opacity: visible ? 1.0 : 0.0
        smooth: false
        source: '../assets/posters/' + systemView.model.shortName + '.jpg'
        visible: status == Image.Ready
        width: 0.535 * systemView.width
        x: 0.678 * systemView.width - 0.5 * width
        y: 0.494 * systemView.height - 0.5 * height
    }

    Image {
        id: x_controller

        fillMode: Image.Stretch
        height: 0.4 * systemView.height
        opacity: visible ? 1.0 : 0.0
        smooth: true
        source: '../assets/controllers/' + systemView.model.shortName + '.png'
        visible: status == Image.Ready
        width: 0.275 * systemView.width
        x: 0.9785 * systemView.width - 1.0 * width
        y: 0.975 * systemView.height - 1.0 * height
    }

    Timer {
        id: fadeInTimer
        interval: 500
        onTriggered: {
            systemInfo.visible = true;
            systemInfo.opacity = 1.0;
        }
    }
}
