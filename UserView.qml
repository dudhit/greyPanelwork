/***************************************************************************
* Copyleft (CC BY-SA 4.0) 2023 Justan O'Strawman  <justanotherstrawman@gmail.com>
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
* OR OTHER DEALINGS IN THE SOFTWARE.
*
***************************************************************************/
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
