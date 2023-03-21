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
Rectangle{
    id:root
    implicitWidth:899
    implicitHeight:800
    anchors.fill:parent
    color:"#00808080"
    property real allBright:1
    property real allDim:0.1
    property color allBkgnd:"#ff000070"
    property color allText:"#ff707070"
    property string allTextFont:"Tahoma"
    property int allTextSize:24
    property int gap:20

    onActiveFocusChanged:{if (activeFocus) ;console.log("viewroot")}

    Column{
        clip:true
        anchors.fill:parent
        spacing:gap
        onActiveFocusChanged:{if (activeFocus) ;console.log("column")}
        GlowButton{id:power;
        visible:sddm.canPowerOff;
            width:parent.width
            height: parent.height*0.2-gap;
            navBright:allBright;navDim:allDim;buttonColour:allBkgnd;onSelectNav:{sddm.powerOff();console.log("off")}
            }
        GlowButton{id:reboot;
        visible:sddm.canReboot;
            width:parent.width
            height:parent.height*0.2-gap
            navBright:allBright;navDim:allDim;buttonColour:allBkgnd;onSelectNav:{sddm.reboot();console.log("reboot")}
            }
        GlowButton{id:suspend;
        visible:sddm.canSuspend;
            width:parent.width
            height:parent.height*0.2-gap
            navBright:allBright;navDim:allDim;buttonColour:allBkgnd;onSelectNav:{sddm.suspend();console.log("susp")}
            }
        GlowButton{id:hibernate;
        visible:sddm.canHibernate;
            width:parent.width
            height:parent.height*0.2-gap
            navBright:allBright;navDim:allDim;buttonColour:allBkgnd;onSelectNav:{sddm.hibernate();console.log("hyber")}
            }
        GlowButton{id:sleep;
        visible:sddm.canHybridSleep;
            width:parent.width
            height:parent.height*0.2-gap
            navBright:allBright;navDim:allDim;buttonColour:allBkgnd;onSelectNav:{sddm.hybridSleep();console.log("sleep")}
            }
    }
    Column{
        clip:true
        anchors.fill:parent
        spacing:gap
        onActiveFocusChanged:{if (activeFocus) ;console.log("column")}

        Text{
            text:"Power Off";
            color:allText;
            width:parent.width
            height:parent.height*0.2-gap
            font.pointSize:allTextSize;font.family:allTextFont;
            wrapMode:Text.WordWrap;
            minimumPointSize:70;minimumPixelSize:20
            horizontalAlignment:Text.AlignHCenter;verticalAlignment:Text.AlignVCenter
        }
        Text{
            text:"Reboot";
            color:allText;
            width:parent.width
            height:parent.height*0.2-gap
            font.pointSize:allTextSize;font.family:allTextFont;
            wrapMode:Text.WordWrap;
            minimumPointSize:70;minimumPixelSize:20
            horizontalAlignment:Text.AlignHCenter;verticalAlignment:Text.AlignVCenter
        }
        Text{
            text:"Suspend";
            color:allText;
            width:parent.width
            height:parent.height*0.2-gap
            font.pointSize:allTextSize;font.family:allTextFont;
            wrapMode:Text.WordWrap;
            minimumPointSize:70;minimumPixelSize:20
            horizontalAlignment:Text.AlignHCenter;verticalAlignment:Text.AlignVCenter
        }
        Text{
            text:"Hibernate";
            color:allText;
            width:parent.width
            height:parent.height*0.2-gap
            font.pointSize:allTextSize;font.family:allTextFont;
            wrapMode:Text.WordWrap;
            minimumPointSize:70;minimumPixelSize:20
            horizontalAlignment:Text.AlignHCenter;verticalAlignment:Text.AlignVCenter
        }
        Text{
            text:"Hybrid Sleep";
            color:allText;
            width:parent.width
            height:parent.height*0.2-gap
            font.pointSize:allTextSize;font.family:allTextFont;
            wrapMode:Text.WordWrap;
            minimumPointSize:70;minimumPixelSize:20
            horizontalAlignment:Text.AlignHCenter;verticalAlignment:Text.AlignVCenter
        }
    }
    //        {  //
    ////            activeFocusOnTab:root.activeFocusOnTab;
    //              //                 KeyNavigation.tab:reboot;KeyNavigation.backtab:sleep
    //                          KeyNavigation.down:reboot;KeyNavigation.up:sleep;
    ////                 KeyNavigation.tab:suspend;KeyNavigation.backtab:power
    //            KeyNavigation.down:suspend;KeyNavigation.up:power;
    ////                 KeyNavigation.tab:hibernate;KeyNavigation.backtab:reboot
    //            KeyNavigation.down:hibernate;KeyNavigation.up:reboot;
    ////                 KeyNavigation.tab:sleep;KeyNavigation.backtab:suspend
    //            KeyNavigation.down:sleep;KeyNavigation.up:suspend;
    ////                 KeyNavigation.tab:power;KeyNavigation.backtab:hibernate
    //            KeyNavigation.down:power;KeyNavigation.up:hibernate;

}

