
import QtQuick 2.0

import 'components/'

FocusScope { 
    FontLoader { id: theme_font; source: 'assets/Acre.otf' }

    SystemView {
        id: systemView
        
        focus: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height
        
        model: api.collections

        onEnter: detailsView.focus = true
    }

    DetailsView {
        id: detailsView
        
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: systemView.bottom
        height: parent.height
    
        model: api.collections
        currentIndex: systemView.currentIndex
        
        onLeave: systemView.focus = true
        onCurrentIndexChanged: if (focus) systemView.currentIndex = currentIndex
    }
  
    states: [
        State {
            when: detailsView.focus
            AnchorChanges {
                target: systemView
                anchors.bottom: parent.top
            }
        }
    ]
  
    transitions: Transition {
        AnchorAnimation {
            duration: 400
            easing.type: Easing.InOutQuad
        }
    }
}
