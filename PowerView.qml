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
//    color:"#00808080"
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
//            onActiveFocusChanged:{if (activeFocus) {;console.log("power  focus",activeFocus)}}
            activeFocusOnTab:true
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.powerOff();/*console.log("off")*/}
            KeyNavigation.down:reboot;KeyNavigation.up:sleep;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
//            show:sddm.canPowerOff;/*text settings*/
            textCol:allText;label:"Power Off";textFont:allTextFont;textSize:allTextSize;
        }
        TextGlowButton{id:reboot;
//            onActiveFocusChanged:{if (activeFocus) ;console.log("reboot focus",activeFocus)}
//            activeFocusOnTab:activeFocus
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.reboot();/*console.log("reboot")*/}
            KeyNavigation.down:suspend;KeyNavigation.up:power;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;/*show:sddm.canReboot;*/
            /*text settings*/
            textCol:allText;label:"Reboot";textFont:allTextFont;
            textSize:allTextSize;}
        TextGlowButton{id:suspend;
//            onActiveFocusChanged:{if (activeFocus) ;console.log("suspend  focus",activeFocus)}
//            activeFocusOnTab:activeFocus
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.suspend();/*console.log("suspend")*/}
            KeyNavigation.down:hibernate;KeyNavigation.up:reboot;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;/*show:sddm.canSuspend;*/
            /*text settings*/
            textCol:allText;label:"Suspend";textFont:allTextFont;textSize:allTextSize;
        }
        TextGlowButton{id:hibernate;
//            onActiveFocusChanged:{if (activeFocus) ;console.log("hibernate  focus",activeFocus)}
//            activeFocusOnTab:activeFocus
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.hibernate();/*console.log("hibernate")*/}
            KeyNavigation.down:sleep;KeyNavigation.up:suspend;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
//            show:sddm.canHibernate;
            /*text settings*/
            textCol:allText;label:"Hibernate";textFont:allTextFont;textSize:allTextSize;
        }
        TextGlowButton{id:sleep;
//            onActiveFocusChanged:{if (activeFocus) ;console.log("sleep  focus",activeFocus)}
//            activeFocusOnTab:activeFocus
            width:parent.width
            height:parent.height*0.2-gap;
            onAction:{sddm.hybridSleep();/*console.log("hybridSleep")*/}
            KeyNavigation.down:power;KeyNavigation.up:hibernate;
            buttonCol:allBkgnd;highOpacity:allBright;lowOpacity:allDim;
//            show:sddm.canHybridSleep;
            /*text settings*/
            textCol:allText;label:"Hybrid Sleep";textFont:allTextFont;textSize:allTextSize;
        }
    }

    ////            activeFocusOnTab:root.activeFocusOnTab;
    //              //                 KeyNavigation.tab:reboot;KeyNavigation.backtab:sleep
    ////                 KeyNavigation.tab:suspend;KeyNavigation.backtab:power
    ////                 KeyNavigation.tab:hibernate;KeyNavigation.backtab:reboot
    ////                 KeyNavigation.tab:sleep;KeyNavigation.backtab:suspend
    ////                 KeyNavigation.tab:power;KeyNavigation.backtab:hibernate

}

