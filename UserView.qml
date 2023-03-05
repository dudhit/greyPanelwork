import QtQuick 2.15
import QtQuick.Layouts 1.15

Component{
    id:root
    readonly property ListView lv:ListView.view
//    color: firstGradient
//    anchors.fill: parent
//        clip: true

    RowLayout {
        id: rowLayout
        //    implicitWidth:899
        //    implicitHeight: 800
//        anchors.fill: parent
        focus: (lv.currentIndex === index) ? true : false
        Text{
            id:fullName
            color: secondGradient
            wrapMode: Text.WordWrap
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            minimumPointSize: 70
            minimumPixelSize: 56
            text: realName
            font.pointSize:20
            horizontalAlignment : Text.AlignLeft
            Layout.fillWidth: true
        }

        Image {
            id: face
            verticalAlignment: Image.AlignLeft//.AlignVCenter
            Layout.fillWidth: true
            source: ".face.icon"
            Layout.rowSpan: 1
            fillMode: Image.Pad
        }

        ColumnLayout{
            spacing: 0
            clip: true
//                            state: (lv.currentIndex === index) ? "active" : ""

            //                onLogin: sddm.login(model.name, passwordFeild.text, sessionIndex);


            Text{
                id:userName
                color: secondGradient
                //                implicitHeight: rect.height*0.25
                wrapMode: Text.WordWrap
                Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
                //                Layout.margins: 30
                text: name
                font.pointSize:20
                horizontalAlignment : Text.AlignHCenter
                Layout.fillWidth: true


            }

            Rectangle {
                id:textHolder
                color: root.color
                Layout.maximumWidth: 430
                Layout.minimumHeight: 0
                Layout.minimumWidth: 175
                Layout.preferredWidth: -1
                Layout.maximumHeight:  108
                Layout.fillWidth: true
                Layout.fillHeight: true
                TextInput{
                    id:passwordFeild
                    padding: 10
                    cursorVisible: true
                    anchors.fill: textHolder
                    color: finalGradient
                    focus:true
                    text:"g"
                    echoMode:TextInput.Password
                    font.pointSize : 30
                    Keys.onPressed: (event)=> {
                                        if (event.key ===event.key === Qt.Key_Enter ||event.key === Qt.Key_Return)
                                        {
                                            lv.currentIndex=model.index; event.accepted = true;
                                            console.log("keyboard event triggered");
                                        }
                                    }
                }
            }


        }
    }

    MouseArea{
        anchors.fill: parent;
        enabled: true;
        onClicked:  {lv.currentIndex=model.index;
            passwordFeild.focus=true;
            console.log("model index:",model.index);
        }
    }
}






/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
