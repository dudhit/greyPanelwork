import QtQuick 2.15
Component{
    id:powerViewDelegate
    Rectangle{
        readonly property ListView lv:ListView.view
        anchors{left:parent.left;right :parent.right}
        color: "#80404040"
        clip:true
        implicitHeight:t1.implicitHeight
        implicitWidth:t1.implicitWidth
           onActiveFocusChanged: {
        console.log("powerViewDelegate active focus is:",activeFocus)
                        console.log("powerViewDelegate focus is:",focus)
           }
        Text{
            id:t1
            color: "#80808000"
            width: parent.width
            wrapMode: Text.WordWrap
            text: availability +" "+callFunction
            font.pointSize:20
            anchors.top:parent.top

        }
    }
}
