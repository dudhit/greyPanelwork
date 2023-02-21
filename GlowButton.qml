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
import QtQuick 2.15
import QtQuick.Controls 2.15
Pane {
    id: root
    property real navBright : 0.5
    property real navDim : 0.1

    y:height*.5
    signal selectNav()
    signal hoverNav()
    signal unHoverNav()

    focusPolicy: Qt.StrongFocus
    //anchors.fill: parent
    background:Rectangle{
        id:navbutton

        color:panelNavColour
        radius: width
        focus: true
        onActiveFocusChanged: {
            console.log("navbutton active focus is:",activeFocus)
        }
        onFocusChanged: {      console.log("navbutton focus is:",focus)
        }
        MouseArea{
            anchors.fill: parent
            enabled: true
            hoverEnabled:true
           // acceptedButtons: Qt.LeftButton
            onClicked: {console.log("navbutton Clicked")
                root.selectNav()
            }
            onEntered: {anime.stop();navbutton.opacity=navBright;root.hoverNav()
            }
            onExited: {anime.start();root.unHoverNav()
            }
        }
        Keys.onPressed: (event)=> {  if (event.key === Qt.Key_Space);  root.selectNav(); event.accepted = true}

        SequentialAnimation {
            id:anime
            running: true
            loops: Animation.Infinite

            NumberAnimation{
                id: faderOut
                target: navbutton
                properties: "opacity"
                from:  navBright
                to:navDim
                duration: 2500
            }

            NumberAnimation{
                id: faderIn
                target: navbutton
                properties: "opacity"
                from:  navDim
                to:navBright
                duration: 5000
            }


        }

    }

}
