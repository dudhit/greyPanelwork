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
        implicitHeight:sessName.height+sessDesc.height+20
        implicitWidth:lv.width
        Column{
            anchors.fill:root
            clip:true
            spacing:10//lv.height/lv.count
            Text{
                id:sessName
                width:parent.width
    //            height: parent.height
                wrapMode:Text.WordWrap
                text:model.name
                font.pointSize:20
    //            anchors.top:parent.top

            }
            Text{
                id:sessDesc
                width:parent.width
                wrapMode:Text.WordWrap
    //            anchors.top:t1.bottom
                text:model.comment
                font.pointSize:20
            }
        }



        MouseArea{
            anchors.fill:root
            enabled:true;
            onClicked:{lv.currentIndex=model.index;
            }
        }
        states:[
            State { when:(lv.currentIndex === index)
                PropertyChanges {   target:root; color:finalGradient  }
                PropertyChanges {   target:sessName; color:firstGradient  }
                PropertyChanges {   target:sessDesc;  color:secondGradient  }
            },
            State { when:(lv.currentIndex !== index)
                PropertyChanges {   target:root; color:"trasparent"}
                PropertyChanges {   target:sessName; color:firstGradient  }
                PropertyChanges {   target:sessDesc; color:firstGradient }
             }
        ]
    }
}
