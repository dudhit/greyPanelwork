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
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import  QtQuick.Window 2.15

Window{
    id:sddm
    height: 760
    width: 1080
    onActiveFocusItemChanged: console.log("activeFocusItem", activeFocusItem)
    property bool canPowerOff:true
    property bool canReboot:true
    property bool canSuspend:true
    property bool canHibernate:false
    property bool canHybridSleep:true
    property string hostName:  qsTr("my pc")//sddm DOES NOT PROVIDE

    QtObject{
        id:config
        property color backGroundColour: "#ff000000"
        property color   backGroundTranspColour:"#800000ff"
        property color    firstGradient: "#ff404040"
        property color   secondGradient: "#ffc0c0c0"
        property color   finalGradient: "#ffeeeeee"
        property color    textColour: "#ff000000"
    }


    Main{
        height:sddm.height
        width: sddm.width
    }
    //    PowerView{}
}
