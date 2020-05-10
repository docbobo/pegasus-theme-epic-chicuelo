
import QtQuick 2.0
import SortFilterProxyModel 0.2

import "utils/helpers.js" as Helpers
import "components/"

FocusScope { 
    property int collectionIndex: -1
    property var currentCollection: delegateModel.get(collectionIndex)
    
    property int currentGameIndex: 0
    readonly property var currentGame: currentCollection.games.get(currentGameIndex)

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

    function filterExpression(modelLeft, modelRight) {
        let left = Helpers.get_sort_key(modelLeft);
        let right = Helpers.get_sort_key(modelRight);

        return left < right;
    }

    SortFilterProxyModel {
        id: delegateModel
        sourceModel: api.collections
        sorters: ExpressionSorter { 
            expression: { return filterExpression(modelLeft, modelRight) }
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
        
        onLeave: systemView.focus = true
        onLaunch: currentGame.launch()
        
        currentIndex: systemView.currentIndex
        onCurrentIndexChanged: if (focus) jumpToCollection(currentIndex)
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
