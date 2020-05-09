// Autogenerated content, do not edit by hand!
// converter v0.1.0

import QtQuick 2.0

PathView {
  id: root

  property int itemWidth
  readonly property int pathWidth: pathItemCount * itemWidth
  
  Keys.onLeftPressed: decrementCurrentIndex()    
  Keys.onRightPressed: incrementCurrentIndex()
  Keys.onUpPressed: currentItem.decrementCurrentIndex()
  Keys.onDownPressed: currentItem.incrementCurrentIndex()
  
  signal itemSelected(var currentGame)
  Keys.onPressed: {
    if (!event.isAutoRepeat && api.keys.isAccept(event)) {
      event.accepted = true;    
      root.itemSelected(currentItem.currentGame);
    }
  }
  snapMode: PathView.SnapOneItem
  preferredHighlightBegin: 0.5
  preferredHighlightEnd: 0.5
  pathItemCount: {
    let count = Math.ceil(width / itemWidth);
    return (count + 2 <= model.count) ? count + 2 : Math.min(count, model.count);
  }
  path: Path {
    startX: (root.width - root.pathWidth) / 2
    startY: root.height / 2
    PathLine {
      x: root.path.startX + root.pathWidth
      y: root.path.startY
    }
  }
}