import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

import '../components/helpers.js' as Helpers

FocusScope {
    id: systemView

    property alias model: menu.model
    property alias currentIndex: menu.currentIndex

    Keys.onUpPressed: {
        console.log("DOWN: " + currentIndex);
        if (currentIndex <= 0)
            currentIndex = api.collections.count - 1;
        else
            currentIndex--;
    }

    Keys.onDownPressed: {
        if (currentIndex >= api.collections.count - 1)
            currentIndex = 0;
        else
            currentIndex++;
    }

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

    Rectangle {
        id: menu
        property var model
        property var currentIndex: 0

        color: '#00000000'
        
        x: 0.055 * parent.width
        y: 0.105 * parent.height

        width: 0.355 * parent.width
        height: 0.785 * parent.height

        Rectangle {
            id: x_logo

            /*
            readonly property alias currentIndex: systemView.currentIndex
            onCurrentIndexChanged: {visible = false; opacity = 0.0; fadeInTimer.restart();}
            Behavior on opacity { NumberAnimation { duration: 300 } }
            */

            color: '#00000000'
            
            x: 0.182 * systemView.width - 0.5 * width
            y: 0.315 * systemView.height - 0.5 * height
            height: 0.7*0.2 * systemView.height
            width: 0.7*0.3 * systemView.width

            Image {
                id: logoImage

                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                opacity: visible ? 1.0 : 0.0
                readonly property string sourceRelPath: { return 'assets/logos/' + menu.model.get(menu.currentIndex).shortName + '.svg'; }
                smooth: true
                source: (sourceRelPath && `../${sourceRelPath}`) || ''
                visible: status == Image.Ready
                Behavior on opacity { NumberAnimation { duration: 120 } }
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
        } 
    }

    Text {
        id: systemInfo

        color: '#4f5159'
        elide: Text.ElideRight
        font.family: theme_font.name
        font.pixelSize: 0.025 * systemView.height
        height: 0.05 * systemView.height
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 1.5
        text: Helpers.format_game_count(systemView.model.get(currentIndex).games.count)
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        width: 0.98 * systemView.width
        wrapMode: Text.WordWrap
        x: 0.232 * systemView.width - 0.5 * width
        y: 0.77 * systemView.height - 0.5 * height   
        
        readonly property alias currentIndex: systemView.currentIndex
        onCurrentIndexChanged: {visible = false; opacity = 0.0; fadeInTimer.restart();}
        Behavior on opacity { NumberAnimation { duration: 300 } }        
    
        /*
        Rectangle {
            anchors.fill: parent
            color: '#00000000'
            z: -1
        } 
        */       
    }
    
    Image {
        id: x_indicator

        fillMode: Image.Stretch
        height: 0.6 * systemView.height
        opacity: visible ? 1.0 : 0.0
        smooth: true
        source: Helpers.lookup_indicator(menu.currentIndex, menu.model.get(menu.currentIndex))
        visible: status == Image.Ready
        width: 0.006 * systemView.width
        x: 0.027 * systemView.width - 0.5 * width
        y: 0.5 * systemView.height - 0.5 * height
    }
    
    Text {
        id: x_shortdescription

        color: Helpers.TEXT_COLOR
        elide: Text.ElideRight
        font.capitalization: Font.AllUppercase
        font.family: theme_font.name
        font.pixelSize: 0.03 * systemView.height
        height: 0.1 * systemView.height
        horizontalAlignment: Text.AlignHCenter
        text: Helpers.lookup_summary(menu.model.get(menu.currentIndex))
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        width: 0.32 * systemView.width
        wrapMode: Text.WordWrap
        x: 0.232 * systemView.width - 0.5 * width
        y: 0.25 * systemView.height - 0.5 * height

        /*
        readonly property alias currentIndex: systemView.currentIndex
        onCurrentIndexChanged: {visible = false; opacity = 0.0; fadeInTimer.restart();}
        Behavior on opacity { NumberAnimation { duration: 300 } }
        */
    }
  
    Text {
        id: x_longdescription

        color: Helpers.TEXT_COLOR
        elide: Text.ElideRight
        font.family: theme_font.name
        font.pixelSize: 0.02 * systemView.height
        height: 0.1 * systemView.height
        horizontalAlignment: Text.AlignHCenter
        text: Helpers.lookup_description(menu.model.get(menu.currentIndex));
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        width: 0.28 * systemView.width
        wrapMode: Text.WordWrap
        x: 0.232 * systemView.width - 0.5 * width
        y: 0.58 * systemView.height - 0.5 * height

        /*
        readonly property alias currentIndex: systemView.currentIndex
        onCurrentIndexChanged: {visible = false; opacity = 0.0; fadeInTimer.restart();}
        Behavior on opacity { NumberAnimation { duration: 300 } }
        */
    }
    
    Image {
        id: x_character

        fillMode: Image.Stretch
        height: 0.86 * systemView.height
        opacity: visible ? 1.0 : 0.0
        smooth: false
        source: '../assets/posters/' + systemView.model.get(currentIndex).shortName + '.jpg'
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
        source: '../assets/controllers/' + systemView.model.get(currentIndex).shortName + '.png'
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

            /*
            x_logo.visible = true;
            x_logo.opacity = 1.0;


            x_shortdescription.visible = true;
            x_shortdescription.opacity = 1.0;

            x_longdescription.visible = true; 
            x_longdescription.opacity = 1.0;
            */
        }
    }
}
