import QtQuick 2.12
import QtQuick.Layouts 1.12
//import QtQuick.Controls 2.12

Rectangle{
    id:textButton
    signal action()
    property color textCol:"#ffb0b0b0"
    property color buttonCol:"#ff404040"
    property real highOpacity:0.6
    property real lowOpacity:0.4
    property string label:"your text here"
    property bool show:true
    property string textFont: "Tahoma"
    property int textSize: 30

    color: "#00ffffff"

    GlowButton{  id:customButton
        visible: show
        anchors.fill:parent
        implicitHeight: 100
        implicitWidth: 100
        buttonColour: buttonCol
        navBright: highOpacity
        navDim:lowOpacity
        onSelectNav: {action()}
        Text{
            id:customtext
            color: textCol
            text:label
            wrapMode: Text.WordWrap
            minimumPointSize: 70
            minimumPixelSize: 20
            font.pointSize:textSize
            horizontalAlignment : Text.AlignHCenter
            verticalAlignment : Text.AlignVCenter
            font.family: textFont
            anchors.fill:parent
        }
    }


}



/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/
