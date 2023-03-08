import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import  QtQuick.Window 2.15

Window{
    id:sddm
    height: 760
    width: 1080
    onActiveFocusItemChanged: console.log("activeFocusItem", activeFocusItem)
    property bool canPowerOff:true
    property bool canReboot:true
    property bool canSuspend:true
    property bool canHibernate:false
    property bool canHybridSleep:true
    property string hostName:  qsTr("my pc")//sddm DOES NOT PROVIDE

    QtObject{
        id:config
        property color backGroundColour: "#ff000000"
        property color   backGroundTranspColour:"#800000ff"
        property color    firstGradient: "#ff404040"
        property color   secondGradient: "#ffc0c0c0"
        property color   finalGradient: "#ffeeeeee"
        property color    textColour: "#ff000000"
    }


    Main{
        height:sddm.height
        width: sddm.width
    }
    //    PowerView{}
}
