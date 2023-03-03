/***************************************************************************
* Copyleft (c) 2023 Justan O'Strawman  <justanotherstrawman@gmail.com>
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
import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id:root
    property alias model: panelList.model
    property alias delegate: panelList.delegate
    property alias flow: panelList.orientation
   // width: 50
//height: 50
    anchors.fill:parent

    ListView{
        id:panelList
        width:root.width
        height:  root.height
        clip:true
        focus: true
        snapMode: ListView.SnapOneItem
        keyNavigationEnabled: true
        keyNavigationWraps: true        
        currentIndex: (model.lastIndex)?model.lastIndex:0
//        activeFocusOnTab: false
        onCurrentIndexChanged: {console.log("index changed to:",currentIndex);
        }
//        onActiveFocusChanged: {
//            console.log("panelList active focus is:",activeFocus)
//        }
//        onFocusChanged: { console.log("panelList focus is:",focus)
//        }
        highlightFollowsCurrentItem: true
        highlight:  Rectangle {
            id:selectionRect

                implicitWidth: 1920
                implicitHeight: 10
            radius: 20
                           color: "#ff0000ff";  }
    }

    }


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
