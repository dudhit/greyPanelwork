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
    Rectangle{
        id:root
        readonly property ListView lv:ListView.view
        color: "#00808080"
        //        anchors.fill: parent
        implicitHeight: lv.height
        implicitWidth: lv.width
        GridLayout{
            anchors.fill: parent
            columns: 2
            rows:4
            clip: true
            focus: (lv.currentIndex === index) ? true : false
            Text{
                id:fullName
                Layout.row:0
                Layout.column:0
                Layout.fillWidth: true
                color: secondGradient
                wrapMode: Text.WordWrap
                minimumPointSize: 70
                minimumPixelSize: 56
                text: model.realName
                font.pointSize:20
            }

            Image {
                id: face
                Layout.row:1
                Layout.column:0
                Layout.fillWidth: true
                Layout.fillHeight: true
//                visible:  (lv.currentIndex === index) ? true : false
                source: ".face.icon"
                fillMode: Image.Pad
            }

            Text{
                id:userName
                Layout.row:1
                Layout.column:1
                Layout.fillWidth: true
                color: secondGradient
                text: "User: "+model.name
                visible:  (lv.currentIndex === index) ? true : false
                wrapMode: Text.WordWrap
                font.pointSize:20
            }
            Text{
                id:prompt
                Layout.row:2
                Layout.column:0
                Layout.columnSpan: 2
                Layout.fillWidth: true
                color: secondGradient
                text: "enter password"
                visible:  (lv.currentIndex === index) ? true : false
                wrapMode: Text.WordWrap
                font.pointSize:20
            }

            Rectangle {
                id:textHolder
                Layout.row:3
                Layout.column:0
                Layout.fillHeight: true
                Layout.columnSpan: 2
                color: firstGradient
                visible:  (lv.currentIndex === index) ? true : false
                Layout.maximumWidth: root.width
                Layout.minimumHeight: 50
                Layout.maximumHeight:  108
                Layout.fillWidth: true
                TextInput{
                    id:passwordFeild
                    //                    padding: 10
                    cursorVisible: true
                    anchors.fill: textHolder
                    anchors.margins: 10
                    color: finalGradient
                    focus:true
                    text:""
                    echoMode:TextInput.Password
                    font.pointSize : 30
                    Keys.onPressed: (event)=> {
                                        if (event.key === Qt.Key_Enter ||event.key === Qt.Key_Return)
                                        {
                                            lv.currentIndex=model.index; event.accepted = true;
                                            console.log("pw is:",passwordFeild.text);
                                        }
                                    }
                }
            }

            //        onFocusChanged: {if(activeFocus === true){forceActiveFocus(passwordFeild)}}
        }
        MouseArea{
            anchors.fill: root
            enabled: true;
            onClicked:  {lv.currentIndex=model.index;
                passwordFeild.focus=true;
                console.log("model index:",model.index);
            }
        }
        Component.onCompleted: {console.log("view loaded")}
        
    }
}






/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
