import QtQuick 2.15
import QtQuick.Layouts 1.15
Component{
    id:userViewDelegate
    Rectangle{
        id:rect
        readonly property ListView lv:ListView.view
              color: "#80000000"
        anchors.fill: parent
        clip: true
        implicitWidth:899
        implicitHeight: 800
        ColumnLayout{
            spacing: 0
            anchors.fill: parent
            clip: true
            focus: (lv.currentIndex === index) ? true : false
            //                state: (lv.currentIndex === index) ? "active" : ""

            //                onLogin: sddm.login(model.name, passwordFeild.text, sessionIndex);

            Text{
                id:fullName
                color: "#ff000000"
//                implicitHeight: rect.height*0.25
                wrapMode: Text.WordWrap
                Layout.margins: 30
                minimumPointSize: 70
                minimumPixelSize: 56
                text: realName
                Layout.alignment:  Qt.AlignVCenter
                font.pointSize:20
                horizontalAlignment : Text.AlignHCenter
                Layout.fillWidth: true
            }
            Image {
                id: face
                verticalAlignment: Image.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                //            Layout.preferredHeight: rect.height
                //             Layout.preferredWidth: parent.width*0.5
                source: ".face.icon"
                fillMode: Image.Pad
            }

            Text{
                id:userName
                color: "#ff000000"
//                implicitHeight: rect.height*0.25
                wrapMode: Text.WordWrap
                Layout.margins: 30
                text: name
                Layout.alignment:  Qt.AlignVCenter
                font.pointSize:20
                horizontalAlignment : Text.AlignHCenter
                Layout.fillWidth: true


            }

            Rectangle {
                id:textHolder
                color: rect.color
                Layout.margins: 30
                Layout.maximumHeight:  300
//                implicitHeight: rect.height*0.25
                Layout.fillWidth: true
                TextInput{
                    id:passwordFeild
                    anchors.margins: 40
                    padding: 10
                    cursorVisible: true
                    anchors.fill: textHolder
                    //                    anchors.horizontalCenter:textHolder.horizontalCenter
                    //                    anchors.verticalCenter:textHolder.verticalCenter
                    focus:true
                    text:"g"
                    echoMode:TextInput.Password
                    font.pointSize : 30

                }
            }
            //            MouseArea{
            //                anchors.fill: parent;
            //                enabled: true;
            //                onClicked:  {lv.currentIndex=model.index;
            //                    passwordFeild.focus=true;
            //                    console.log("model index:",model.index);
            //                }
            //            }

        }

    }
}
/*      Keys.onPressed: (event)=> {
                                        if (event.key === Qt.Key_Space ||event.key === Qt.Key_Enter ||event.key === Qt.Key_Return)
                                        {
                                            lv.currentIndex=model.index; event.accepted = true;
                                            console.log("keyboard event triggered");
                                        }
                                    }*/
//
//        id:container
//        color: "#80404040"
////        clip:true
////        focus: true
//        implicitHeight:Math.max(pic.implicitHeight,fullName.implicitHeight+userName.implicitHeight)
//        implicitWidth:pic.implicitWidth+fullName.implicitWidth
//        onActiveFocusChanged: {
//            console.log("userViewDelegate active focus is:",activeFocus);
//            console.log("userViewDelegate focus is:",focus);
//        }





/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
