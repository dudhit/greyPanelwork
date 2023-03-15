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
    id:sessionViewDelegate
    Rectangle{
        readonly property ListView lv:ListView.view
        color: "#80404040"
        clip:true
//        focus: true
        implicitHeight:t1.implicitHeight+t2.implicitHeight
        implicitWidth:lv.Width
        onActiveFocusChanged: {
        console.log("sessionViewDelegate active focus is:",activeFocus);
        }
        onFocusChanged: {
                        console.log("sessionViewDelegate focus is:",focus);
        }
        Text{
            id:t1
            color: lv.isCurrentItem?"#ffffffff":"#80808000"
            width: parent.width
            wrapMode: Text.WordWrap
            text:model.name
            font.pointSize:20
            anchors.top:parent.top

        }
        Text{
            id:t2
            width: parent.width
            wrapMode: Text.WordWrap
            anchors.top: t1.bottom
            text:model.comment
            color: lv.isCurrentItem?"#ff000000":"white"
            font.pointSize:20
        }
        Text{
            id:t3
            color: "#ffffffff"
            width: parent.width
            wrapMode: Text.WordWrap
            text:lv.currentIndex
            font.pointSize:20
            anchors.top:t2.bottom

        }

        MouseArea{
            anchors.fill:parent
            onClicked: {lv.currentIndex=model.index;
//                sessionIndex:lv.currentIndex;
                console.log("model index:",model.index);
            }
        }


    }
}
