import QtQuick 2.15
import QtQuick.Layouts 1.15

/***************************************************************************
* Copyleft (CC BY-SA 4.0) 2023 Justan O'Strawman <justanotherstrawman@gmail.com>
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
Component{
    Rectangle{
        id:root
        readonly property ListView lv:ListView.view
        color: "#00808080"
        implicitHeight: lv.height
        implicitWidth: lv.width
        GridLayout{
            id:grid
            anchors.fill: parent
            columns: 3
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
                //                font.pointSize:20
            }

            Image {
                id: face
                Layout.row:1
                Layout.column:0
                Layout.columnSpan: 3
                Layout.fillWidth: true
                Layout.fillHeight: true
                source: model.icon
                fillMode: Image.Pad
            }

            Text{
                id:userName
                Layout.row:2
                Layout.column:0
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignBottom
                color: secondGradient
                text: model.name
                wrapMode: Text.WordWrap
                //                font.pointSize:20
            }

            Rectangle {
                id:textHolder
                Layout.row:3
                Layout.column:0
                Layout.columnSpan: 3
                Layout.fillHeight: true
                color: firstGradient
                //                visible: (lv.currentIndex === index) ? true : false
                Layout.maximumWidth: root.width
                Layout.minimumHeight: 50
                Layout.maximumHeight: 108
                Layout.fillWidth: true
                TextInput{
                    id:passwordFeild
                    cursorVisible: true
                    anchors.fill: textHolder
                    anchors.margins: 10
                    color: finalGradient
                    focus:true
                    text:""
                    echoMode:TextInput.Password
                    //                    font.pointSize : 30
                    Keys.onPressed: (event)=> {
                                        if (event.key === Qt.Key_Enter ||event.key === Qt.Key_Return)
                                        {
                                            lv.currentIndex=model.index; event.accepted = true;
                                            console.log("pw is:",passwordFeild.text);
                                            console.log("user is:",model.name);
                                        }
                                    }
                }
//                onVisibleChanged: {if(visible){opacity=1}else{opacity=0}}
//                onFocusChanged: {if(activeFocus ===true){forceActiveFocus(passwordFeild);}}
            }

            }
            transitions:Transition {
                NumberAnimation { properties:"color"; duration:1900; easing.type:Easing.OutInQuart }
            }
            MouseArea{

                anchors.fill: root
                enabled: true;
                onClicked: {lv.currentIndex=model.index;
                    //                forceActiveFocus(passwordFeild);
                    //                console.log("model index:",model.index);
                }
                //        onEntered: {console.log("mouse in")}
                //        onExited: {console.log("mouse out")}

            }
            //        Component.onCompleted: {console.log("view loaded");}

            states: [
                State { when: (lv.currentIndex === index)
                    PropertyChanges {   target: textHolder; color: firstGradient   }
                    PropertyChanges {   target: userName;  color:  secondGradient  }
                    PropertyChanges {   target: passwordFeild; color: finalGradient  }
                    PropertyChanges {   target: passwordFeild; focus: true    }
                },
                State { when: (lv.currentIndex !== index)
                    PropertyChanges {   target: textHolder; color: backGroundTranspColour   }
                    PropertyChanges {   target: userName; color: backGroundTranspColour  }
                    PropertyChanges {   target: passwordFeild; color: backGroundTranspColour  }
                }
            ]
        }

    }




    /*##^##
Designer {
 D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
