import QtQuick 2.15
import QtQuick.Layouts 1.12
Rectangle{
    id:root
    implicitWidth:899
    implicitHeight: 800
    color:"transparent"
    ColumnLayout{
        clip:true
        anchors.fill:parent
        /*should use a Repeater but meh*/
        GlowButton{  id:powerOff
            visible: sddm.canPowerOff
            Layout.fillWidth: true
            Layout.fillHeight:  true
            buttonColour: secondGradient
                     KeyNavigation.down: reboot
            onSelectNav: {sddm.powerOff();}
            Text{
                id:powerOffText
                color: "#ff000000"
                wrapMode: Text.WordWrap
                minimumPointSize: 70
                minimumPixelSize: 56
                text: "Power Off"
                font.pointSize:40
                horizontalAlignment : Text.AlignHCenter
                verticalAlignment : Text.AlignVCenter
                anchors.fill:parent
            }

        }
        GlowButton{  id:reboot
            visible: sddm.canReboot
            Layout.fillWidth: true
            Layout.fillHeight: true
            buttonColour: secondGradient
            KeyNavigation.down: suspend
            onSelectNav: {sddm.reboot();}
            Text{
                id:rebootText
                color: "#ff000000"
                wrapMode: Text.WordWrap
                minimumPointSize: 70
                minimumPixelSize: 56
                text: "reboot"
                font.pointSize:40
                horizontalAlignment : Text.AlignHCenter
                verticalAlignment : Text.AlignVCenter
                anchors.fill:parent
            }
        }
        GlowButton{  id:suspend
            visible: sddm.canSuspend
            Layout.fillWidth: true
            Layout.fillHeight:  true
            buttonColour: secondGradient
            KeyNavigation.down: hibernate
            onSelectNav: {sddm.suspend();}
            Text{
                id:suspendText
                color: "#ff000000"
                wrapMode: Text.WordWrap
                minimumPointSize: 70
                minimumPixelSize: 56
                text: "suspend"
                font.pointSize:40
                horizontalAlignment : Text.AlignHCenter
                verticalAlignment : Text.AlignVCenter
                anchors.fill:parent
            }
        }
        GlowButton{  id:hibernate
            visible: sddm.canHibernate
            Layout.fillWidth: true
            Layout.fillHeight:  true
            buttonColour: secondGradient
            KeyNavigation.down: hybridSleep
            onSelectNav: {sddm.hibernate();}
            Text{
                id:hibernateText
                color: "#ff000000"
                wrapMode: Text.WordWrap
                minimumPointSize: 70
                minimumPixelSize: 56
                text: "hibernate"
                font.pointSize:40
                horizontalAlignment : Text.AlignHCenter
                verticalAlignment : Text.AlignVCenter
                anchors.fill:parent
            }
        }
        GlowButton{  id:hybridSleep
            visible: sddm.canHybridSleep
            Layout.fillWidth: true
            Layout.fillHeight:  true
            buttonColour: secondGradient
            KeyNavigation.down: powerOff
            onSelectNav: {sddm.hybridSleep();}
            Text{
                id:hybridSleepText
                color: "#ff000000"
                wrapMode: Text.WordWrap
                minimumPointSize: 70
                minimumPixelSize: 56
                text: "hybrid Sleep"
                font.pointSize:40
                horizontalAlignment : Text.AlignHCenter
                verticalAlignment : Text.AlignVCenter
                anchors.fill:parent
            }
        }
    }

}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
