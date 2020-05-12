
import QtQuick 2.0
import SortFilterProxyModel 0.2

import "utils/helpers.js" as Helpers
import "components/"

FocusScope { 
    property var collectionsModel: new Array();

    property int collectionIndex: -1
    property var currentCollection: collectionsModel[collectionIndex]
    
    property int currentGameIndex: -1
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
        collectionIndex = modulo(idx, collectionsModel.length);
    }

    FontLoader { id: theme_font; source: 'assets/Acre.otf' }

    SortFilterProxyModel {
        id: favGames
        sourceModel: api.allGames
        filters: ValueFilter {
            roleName: "favorite"
            value: true
        }
    }

    property var favCollection: {
        return {
            name: "Favorites",
            shortName: "auto-favorites",
            games: favGames
        }
    }

    function filterExpression(modelLeft, modelRight) {
        let left = Helpers.get_sort_key(modelLeft);
        let right = Helpers.get_sort_key(modelRight);
        return left < right ? -1 : 1;
    }

    Component.onCompleted: {
        api.collections.toVarArray().forEach(collection => {
            collectionsModel.push(collection);
        });

        collectionsModel.push(favCollection);
        collectionsModel.sort(filterExpression);
        jumpToCollection(0);
        currentGameIndex = 0;
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

        onEnter: {detailsView.model = collectionsModel; detailsView.focus = true; }

        onCollectionNext: nextCollection()
        onCollectionPrev: prevCollection()
    }

    DetailsView {
        id: detailsView
        
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: systemView.bottom
        height: parent.height
    
        model: collectionsModel
        
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
