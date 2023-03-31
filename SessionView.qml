import QtQuick 2.15
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

Component{
    Rectangle{
        id:root
        readonly property ListView lv:ListView.view
        color:main.backGroundTranspColour
        implicitHeight:20+sessName.height+sessDesc.height//lv.height*.5//sessName.height+sessDesc.height+20
        implicitWidth:lv.width
        focus: false
        radius:width*0.25
        Column{
            anchors.fill:root
            clip:true
            spacing:10//lv.height/lv.count
            Text{
                id:sessName
                width:parent.width
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment:  Text.AlignVCenter
                wrapMode:Text.WordWrap
                text:model.name
                color:main.firstGradient
                font.pointSize:main.generalTextSize
                font.family:main.preferredFont

            }
            Text{
                id:sessDesc
                width:parent.width
                horizontalAlignment:  Text.AlignHCenter
                verticalAlignment:  Text.AlignVCenter
                wrapMode:Text.WordWrap
                text:model.comment
                color:main.firstGradient
                font.pointSize:main.generalTextSize
                font.family:main.preferredFont
            }
        }



        MouseArea{
            id:theMouse
            anchors.fill:root
            enabled:true;
            onClicked:{lv.currentIndex=model.index;sessionIndex=model.index;
            }
        }    transitions:Transition {
            NumberAnimation { properties:"color"; duration:400; easing.type:Easing.InQuart }
        }
        states:[
            State { when:(lv.currentIndex === index)
                PropertyChanges {   target:root; color:main.firstGradient }
                PropertyChanges {   target:sessName; color:main.textColour  }
                PropertyChanges {   target:sessDesc;  color:main.textColour  }
            },
            State { when:(lv.currentIndex !== index)
                PropertyChanges {   target:root; color:main.backGroundTranspColour}
                PropertyChanges {   target:sessName; color:main.firstGradient  }
                PropertyChanges {   target:sessDesc; color:main.firstGradient }
            }
        ]
        Keys.onPressed:(event)=> {
                           if (event.key === Qt.Key_Space||event.key === Qt.Key_Return)
                           {
                               lv.currentIndex=model.index;sessionIndex=model.index;  event.accepted = true;
                           }
                       }
    }
}
