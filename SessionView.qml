import QtQuick 2.15
Component{
    id:sessionViewDelegate
    Rectangle{
        readonly property ListView lv:ListView.view
        color: "#80404040"
        clip:true
//        focus: true
        implicitHeight:t1.implicitHeight+t2.implicitHeight
        implicitWidth:lv.Width
        onActiveFocusChanged: {
        console.log("sessionViewDelegate active focus is:",activeFocus);
        }
        onFocusChanged: {
                        console.log("sessionViewDelegate focus is:",focus);
        }
        Text{
            id:t1
            color: lv.isCurrentItem?"#ffffffff":"#80808000"
            width: parent.width
            wrapMode: Text.WordWrap
            text:model.name
            font.pointSize:20
            anchors.top:parent.top

        }
        Text{
            id:t2
            width: parent.width
            wrapMode: Text.WordWrap
            anchors.top: t1.bottom
            text:model.comment
            color: lv.isCurrentItem?"#ff000000":"white"
            font.pointSize:20
        }
        Text{
            id:t3
            color: "#ffffffff"
            width: parent.width
            wrapMode: Text.WordWrap
            text:lv.currentIndex
            font.pointSize:20
            anchors.top:t2.bottom

        }

        MouseArea{
            anchors.fill:parent
            onClicked: {lv.currentIndex=model.index;
//                sessionIndex:lv.currentIndex;
                console.log("model index:",model.index);
            }
        }


    }
}
