import QtQuick 2.12
import QtQuick.Layouts 1.12
//import QtQuick.Controls 2.12
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


Item{
    id:textButton
    /*glow button settings*/
    signal action()
    property color textCol:"#ffb0b0b0"
    property color buttonCol:"#ff404040"
    property real highOpacity:0.6
    property real lowOpacity:0.4
    property bool show:true
    /*text settings*/
    property string label:"your text here"
    property string textFont: "Tahoma"
    property int textSize: 30

//    color: "#00ffffff"

     GlowButton{  id:customButton
        visible: show
        focus:true;
        anchors.fill:parent
        implicitHeight: 100
        implicitWidth: 100
        buttonColour: buttonCol
        navBright: highOpacity
        navDim:lowOpacity
        onSelectNav: {action()}
        Text{
         id:customtext
         color: textCol
         text:label
         focus: false
         wrapMode: Text.WordWrap
         minimumPointSize: 70
         minimumPixelSize: 20
         font.pointSize:textSize
         horizontalAlignment : Text.AlignHCenter
         verticalAlignment : Text.AlignVCenter
         font.family: textFont
         anchors.fill:parent
     }
}
}
