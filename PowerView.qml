import QtQuick 2.15
import QtQuick.Layouts 1.12
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
FocusScope{
    id:root
    implicitWidth:899
    implicitHeight:800
    anchors.fill:parent
    property real allBright:1
    property real allDim:0.1
    property color allBkgnd:"#ff000070"
    property color allText:"#ff707070"
    property string allTextFont:"Tahoma"
    property int allTextSize:24
    property int gap:20

    Column{
        clip:true
        anchors.fill:parent
        spacing:gap
        TextGlowButton{id:power;
            activeFocusOnTab:true
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.powerOff();}
            KeyNavigation.down:reboot;KeyNavigation.up:sleep;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
            textCol:allText;label:"Power Off";textFont:allTextFont;textSize:allTextSize;
        }
        TextGlowButton{id:reboot;
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.reboot();}
            KeyNavigation.down:suspend;KeyNavigation.up:power;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
            /*text settings*/
            textCol:allText;label:"Reboot";textFont:allTextFont;
            textSize:allTextSize;}
        TextGlowButton{id:suspend;
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.suspend();}
            KeyNavigation.down:hibernate;KeyNavigation.up:reboot;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
            /*text settings*/
            textCol:allText;label:"Suspend";textFont:allTextFont;textSize:allTextSize;
        }
        TextGlowButton{id:hibernate;
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.hibernate();}
            KeyNavigation.down:sleep;KeyNavigation.up:suspend;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
            /*text settings*/
            textCol:allText;label:"Hibernate";textFont:allTextFont;textSize:allTextSize;
        }
        TextGlowButton{id:sleep;
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.hybridSleep();}
            KeyNavigation.down:power;KeyNavigation.up:hibernate;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
            /*text settings*/
            textCol:allText;label:"Hybrid Sleep";textFont:allTextFont;textSize:allTextSize;
        }
    }
}

