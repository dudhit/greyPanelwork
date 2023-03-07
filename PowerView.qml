import QtQuick 2.15
import QtQuick.Layouts 1.12
Rectangle{
    id:root
    implicitWidth:899
    implicitHeight: 800
    color:"transparent"
    property real allBright:1
    property real allDim:0.5
    property color allBkgnd:"#ff000070"
    property color allText:"#ff707070"

/*    ListModel{
//        id: powerModel
//        ListElement{ name:"Power Off";show:"sddm.canPowerOff";callFunction:"sddm.powerOff()";bright:1;dim:0.75;colour:"#ff000070"}
//        ListElement{ name:"Reboot";show:"sddm.canReboot";callFunction:"sddm.reboot()";bright:0.75;dim:0.7;colour:"#ff007070"}
//        ListElement{ name:"Suspend";show:"sddm.canSuspend";callFunction:"sddm.suspend()";bright:1;dim:0.5;colour:"#ff700070"}
//        ListElement{ name:"Hibernate";show:"sddm.canHibernate";callFunction:"sddm.hibernate()";bright:0.5;dim:0.25;colour:"#ff000070"}
//        ListElement{ name:"Hybrid Sleep";show:"sddm.canHybridSleep";callFunction:"sddm.hybridSleep()";bright:1;dim:0;colour:"#ff707000"}
//    }
*/
    ColumnLayout{
        clip:true
        anchors.fill:parent
        spacing: 20
        TextGlowButton{
            Layout.fillWidth: true
            Layout.fillHeight:  true
            label: "Power Off"
            textCol:allText
            buttonCol:allBkgnd
            highOpacity:allBright
            lowOpacity:allDim
show:sddm.canPowerOff
onAction: {console.log("power off")}

        }
        TextGlowButton{
            Layout.fillWidth: true
            Layout.fillHeight:  true
            label: "Reboot"
            textCol:allText
            buttonCol:allBkgnd
            highOpacity:allBright
            lowOpacity:allDim
            show:sddm.canReboot
                onAction: {console.log("sddm.canReboot")}

        }
        TextGlowButton{
            Layout.fillWidth: true
            Layout.fillHeight:  true
            label: "Suspend"
            textCol:allText
            buttonCol:allBkgnd
            highOpacity:allBright
            lowOpacity:allDim
            show:sddm.canSuspend
                onAction: {console.log("sddm.canSuspend")}


        }
        TextGlowButton{
            Layout.fillWidth: true
            Layout.fillHeight:  true
            label: "Hibernate"
            textCol:allText
            buttonCol:allBkgnd
            highOpacity:allBright
            lowOpacity:allDim
            show:sddm.canHibernate
                onAction: {console.log("sddm.canHibernate")}


        }
        TextGlowButton{
            Layout.fillWidth: true
            Layout.fillHeight:  true
            label: "Hybrid Sleep"
            textCol:allText
            buttonCol:allBkgnd
            highOpacity:allBright
            lowOpacity:allDim
            show:sddm.canHybridSleep
                onAction: {console.log("sddm.canHybridSleep")}


        }

/*        Repeater{
//            id:repeater
//            model: powerModel
//            delegate: Component{
                TextGlowButton{
                    Layout.fillWidth: true
                    Layout.fillHeight:  true
                    label: model.name
                    textCol:"#ffb0b0b0"
                    buttonCol:model.colour
                    highOpacity:model.bright
                    lowOpacity:model.dim
                    //  show:true
                    //  textFont: "Tahoma"
                    textSize: 20


                }
//            }
//            Component.onCompleted: {
//                console.log("finished:", repeater.itemAt(index))
//                //     myRect.x = (function(){ return repeater.itemAt(0).x; }) //binding}
*/
    }



        }


