import QtQuick 2.15
import QtQuick.Controls 2.15
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
FocusScope {
    id: root
    property real navBright : 0.5
    property real navDim : 0.1
    property alias buttonColour:glowButton.color
    signal selectNav()
    signal hoverNav()
    signal unHoverNav()
    clip:true
    implicitWidth:100
    implicitHeight:100

    Rectangle{
        id:glowButton
        anchors.fill: parent;
        anchors.margins: 5;
        color:"#ff008000"
        radius: width*0.5
        focus: true
        onActiveFocusChanged: {
            if(activeFocus ===true)
            {
                glowButton.state="hasFocus";anime.stop();glowButton.forceActiveFocus()
            }
            else{
                glowButton.state="";anime.start()
            }
        }
        states:  [
            State {
                name: ""
                PropertyChanges {
                    target: glowButton;
                    opacity:  navDim ;
                    anchors.margins: 5;
                }
            },
            State {
                name: "hasFocus"
                PropertyChanges {
                    target: glowButton;
                    opacity:  navBright ;
                    anchors.margins: 0;
                }
            }
        ]

        MouseArea{
            anchors.fill: parent
            enabled: true
            hoverEnabled:true
            onClicked: {root.selectNav();}
            onEntered: {anime.stop();glowButton.state="hasFocus";root.hoverNav();glowButton.forceActiveFocus();}
            onExited: {anime.start();glowButton.state="";root.unHoverNav();}
        }
        Keys.onPressed: (event)=> {  if (event.key === Qt.Key_Space){  root.selectNav();event.accepted = true;}}

        SequentialAnimation {
            id:anime
            running: true
            loops: Animation.Infinite

            NumberAnimation{
                id: faderOut
                target: glowButton
                properties: "opacity"
                from:  navBright
                to:navDim
                duration: 2500
            }

            NumberAnimation{
                id: faderIn
                target: glowButton
                properties: "opacity"
                from:  navDim
                to:navBright
                duration: 5000
            }


        }

    }

}


