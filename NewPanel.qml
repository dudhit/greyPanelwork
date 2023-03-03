import QtQuick 2.15
import QtQuick.Controls 2.15
/*read this again

https://doc.qt.io/qt-6/qtquick-input-focus.html


*/
Pane{
    id:root

    property int childIndex:0
    focusPolicy: Qt.StrongFocus
    function cycle()
    {
        for (var i = 0; i < root.contentItem.children.length; i++)
        {
            console.log("item "+i);
            console.log(root.contentItem.children[i].propname);
        }
    }
    background: Rectangle{color:"#00000000"}
    contentItem:  Column{
        id: column
        spacing: parent.height*.1
        anchors.fill: parent
        //   width: 500
        //  height: 500
        Rectangle{ id: rect1;width:30; height: 25;color: "#c0c0c0";  focus: true;  }
        Rectangle{ id: rect2;width:50; height: 50; color: "#259313";   focus: true;  }
        Rectangle{ id: rect3; width:25;height: 100; color: "#808080";  focus: true; }
        Rectangle{ id: rect4;width:150; height: 150; color: "#c52d2d";   focus: true;
            Button{
                onClicked:  {console.log(root.contentItem.children.length);
                    root.cycle();
                }
            }
        }

    }
}
