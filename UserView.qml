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
        color:"#00808080"
        implicitHeight:lv.height
        implicitWidth:lv.width
       ColumnLayout{
            id:columnLayout
            anchors.fill:parent
            clip:true
            focus:(lv.currentIndex === index) ? true :false
            Text{
                id:fullName
                Layout.fillWidth:true
                color:secondGradient
                wrapMode:Text.WordWrap
                minimumPointSize:70
                minimumPixelSize:56
                text:model.realName
            }

            Image {
                id:face
                Layout.fillWidth:true
                source:model.icon
                fillMode:Image.Pad
            }

            Text{
                id:userName
                Layout.fillWidth:false
                Layout.fillHeight:true
                Layout.alignment:Qt.AlignVCenter
                color:secondGradient
                text:model.name
                wrapMode:Text.WordWrap
            }

            Rectangle {
                id:textHolder
//                Layout.fillHeight:true
                color:firstGradient
                Layout.maximumWidth:0
                Layout.minimumHeight:50
                Layout.maximumHeight:108
                Layout.fillWidth:false
                TextInput{
                    id:passwordFeild
                    cursorVisible:true
                    anchors.fill:textHolder
                    anchors.margins:10
                    color:finalGradient
                    focus:true
                    text: ""
                    echoMode:TextInput.Password


                    mouseSelectionMode :TextInput.SelectWords


                    passwordCharacter : "*"


                    Keys.onPressed:(event)=> {
                                        if (event.key === Qt.Key_Enter ||event.key === Qt.Key_Return)
                                        {
                                            lv.currentIndex=model.index; event.accepted = true;
                                            console.log("pw is:",passwordFeild.text);
                                            console.log("user is:",model.name);
//                                           sddm.login(sessionIndex)
                                        }}
                }
                }


            }
            transitions:Transition {
                NumberAnimation { properties:"Height,Width,font.pointSize"; duration:400; easing.type:Easing.OutQuart }
            }
            MouseArea{
                anchors.fill:root
                enabled:true;
                onClicked:{lv.currentIndex=model.index;
                }

            }

            states:[
                State { when:(lv.currentIndex === index)
                    PropertyChanges {   target:textHolder; Layout.fillWidth:true;Layout.maximumWidth:root.width; color:firstGradient  }
                    PropertyChanges {   target:userName; font.pointSize:17;Layout.fillWidth:true ; color:secondGradient  }
                    PropertyChanges {   target:passwordFeild; focus:true ; font.pointSize:17; color:finalGradient; }
                },
                State { when:(lv.currentIndex !== index)
                    PropertyChanges {   target:textHolder;Layout.fillWidth:false;Layout.maximumWidth:0 ; color:"#00ffffff" }
                    PropertyChanges {   target:userName; font.pointSize:1;Layout.fillWidth:false;width:0 ; color:"#00ffffff" }
                    PropertyChanges {   target:passwordFeild;  font.pointSize:1; color:"#00ffffff" }
                 }
            ]
        }

    }




    /*##^##
Designer {
 D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}
}
##^##*/
