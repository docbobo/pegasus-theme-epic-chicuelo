
import QtQuick 2.0
import SortFilterProxyModel 0.2

import 'components/'

FocusScope { 
    property int collectionIndex: -1
    property var currentCollection: delegateModel.get(collectionIndex)

    function modulo(a,n) {
        return (a % n + n) % n;
    }

    function nextCollection () {
        jumpToCollection(collectionIndex + 1);
    }

    function prevCollection() {
        jumpToCollection(collectionIndex - 1);
    }

    function jumpToCollection(idx) {
        collectionIndex = modulo(idx, api.collections.count);
    }

    FontLoader { id: theme_font; source: 'assets/Acre.otf' }

    SortFilterProxyModel {
        id: delegateModel
        sourceModel: api.collections
        sorters: ExpressionSorter { 
            expression: {
                if (modelRight.name == "power") {
                    return 1;
                }

                return modelLeft.name < modelRight.name;
            }
        }
    }

    Component.onCompleted: {
        jumpToCollection(0);
    }

    SystemView {
        id: systemView
        
        focus: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height
        
        model: currentCollection
        currentIndex: collectionIndex

        onEnter: detailsView.focus = true

        onCollectionNext: nextCollection()
        onCollectionPrev: prevCollection()
    }

    DetailsView {
        id: detailsView
        
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: systemView.bottom
        height: parent.height
    
        model: delegateModel
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
