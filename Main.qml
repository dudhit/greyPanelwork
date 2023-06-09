import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import SddmComponents 2.0
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


/* greeter only */
//import SddmComponents 2.0
/* qt creator only */
//import "SddmComponents" as SddmComponents

/*sddm access
https://github.com/sddm/sddm/blob/develop/docs/THEMING.md
Properties

hostName:Holds the name of the host computer.

canPowerOff:true, if we can power off the machine; false, otherwise

canReboot:true, if we can reboot the machine; false, otherwise

canSuspend:true, if the machine supports suspending to the memory; false, otherwise

canHibernate:true, if the machine supports hibernating, e.g suspending to the disk; false, otherwise

canHybridSleep:true, if the machine supports hybrid sleep, e.g suspending to both memory and disk; false, otherwise
Methods

powerOff():Powers of the machine.

reboot():Reboots the machine.

suspend():Suspends the machine to the memory.

hibernate():Suspends the machine to the disk.

hybridSleep():Suspends the machine both to the memory and the disk.

login(user, password, sessionIndex):Attempts to login as the user, using the password into the session pointed by the sessionIndex. Either the loginFailed or the loginSucceeded signal will be emitted depending on whether the operation is successful or not.
Signals

loginFailed():Emitted when a requested login operation fails.

loginSucceeded():Emitted when a requested login operation succeeds.
screenModel:
 provides:name , geometry ,primary

sessionModel:
 provides:file, name, exec , comment , lastIndex

userModel:
 provides name, realName, homeDir , icon , lastIndex , lastUser

*sddm locale selection sessionModel modelItem.modelData.shortName
*sddm.login(model.name, password, sessionIndex);
*error text __sddm_errors

*/
Item{
    id:main
    visible:true
    //sddm will force full screen but scrolling clock is static without a size
    implicitHeight:/*parent.height*/ 108
    implicitWidth:/*parent.width*/ 192

    property int sessionIndex:0//:session.index
//    property string tempPw:""
//    property string tempUser:""
    property color backGroundColour:config.backGroundColour
    property color backGroundTranspColour:config.backGroundTranspColour
    property color firstGradient:config.firstGradient
    property color secondGradient:config.secondGradient
    property color finalGradient:config.finalGradient
    property color textColour:config.textColour
    property color dateTextColour:config.dateTextColour
    property color dateTextShadow:config.dateTextShadow
    property string preferredFont:config.preferredFont
    property int panelHeaderSize:config.panelHeaderSize
    property int generalTextSize:config.generalTextSize
    property int buttonAffectSpeed:config.buttonAffectSpeed
    property real buttonMaxOpacity:config.buttonMaxOpacity
    property real buttonMinOpacity:config.buttonMinOpacity
    property int dateSize:config.dateSize
    property int windowWidth:main.width
    property int windowHeight:main.height


    /* greeter only */

        Connections {
            id:greeter
            target:sddm
            function onLoginSucceeded(){
//                testpass.text = 'logging in'
            }

            function onLoginFailed(){
//                  testpass.text = 'login Failed'
    //            // // listView.currentItem.password = ""
            }
        }

    Rectangle{
        id:backFrame
        width:main.windowWidth
        height:main.windowHeight
        color:main.backGroundColour
        anchors.verticalCenter:parent.verticalCenter
        anchors.horizontalCenter:parent.horizontalCenter

        Rectangle{
            anchors.fill:parent
            gradient:Gradient {
                GradientStop { position:0.0; color:main.backGroundColour }
                GradientStop { position:0.45; color:main.firstGradient }
                GradientStop { position:0.48; color:main.secondGradient }
                GradientStop { position:0.5; color:main.finalGradient }
                GradientStop { position:0.52; color:main.secondGradient }
                GradientStop { position:0.55; color:main.firstGradient }
                GradientStop { position:1.0; color:main.backGroundColour }
            }

            // onStatusChanged:{
            // }
            MouseArea {
                anchors.fill:parent
                cursorShape:Qt.CrossCursor
                onClicked:{
                    if (options.state === "")
                        options.state="showUsers"
                    else
                        options.state=""
                }
            }

        }
        // Item {

        Rectangle{
            height:3
            width:parent.width
            color:main.backGroundTranspColour
            AnimatedSprite {
                anchors.verticalCenter:parent.verticalCenter
                anchors.fill:parent
                source:"anigreygrad.png"
                frameWidth:1
                frameHeight:3
                frameCount:9
                frameDuration:1300
                interpolate:true
                loops:AnimatedSprite.Infinite
            }
            anchors.verticalCenter:parent.verticalCenter
            anchors.horizontalCenter:parent.horizontalCenter
        }
        Rectangle{
            id:timeStatus
            color:main.backGroundTranspColour
            y:(parent.height*0.10)
            x:0//parent.width*0.5
            // width:0
            // height:0 //(parent.height/4)*3
            //focus:true
            activeFocusOnTab:false
            TimeStamp{
                id:clockShadow
                x:2
                y:2
                timeFont:main.preferredFont
                timeSize:main.dateSize
                fontColour:main.dateTextShadow
            }
            TimeStamp{
                id:clock
                timeFont:main.preferredFont
                timeSize:main.dateSize
                fontColour:main.dateTextColour
            }


            SequentialAnimation{running:true;loops:Animation.Infinite

                NumberAnimation{id:clockFromRight;target:timeStatus;properties:"x";from:main.width*.75;to:10;duration:10000;}
                NumberAnimation{id:clockToRight;target:timeStatus;properties:"x";from:10;to:main.width*.75;duration:10000;}
            }
            SequentialAnimation{running:true
                loops:Animation.Infinite
                NumberAnimation{id:shadowmove1;target:clockShadow;properties:"x";from:-2;to:2;duration:5000;}
                NumberAnimation{id:shadowmove2;target:clockShadow;properties:"x";from:2;to:-2;duration:5000;}
            }

        }
        Rectangle{

            id:options
            height:1//main.windowHeight*0.66
            width:main.windowWidth
            color:"transparent"
            anchors.verticalCenter:parent.verticalCenter
            state:"showUsers"



            /* state change order showUsers>showPower>showSession */
            states:[
                State {
                    name:""
                    PropertyChanges {target:userSelect;opacity:0;height:0;width:0; showList:false;loadThis:""}
                    PropertyChanges {target:powerSelect;opacity:0;height:0;width:0 ; showList:false;loadThis:""}
                    PropertyChanges {target:desktopSelect;opacity:0; height:0; width:0; showList:false;loadThis:""}
                },
                State {
                    name:"showUsers"
                    PropertyChanges { target:powerSelect; opacity:0; height:0; width:0; x:windowWidth; panelHeaderPointsize:1;showList:false;loadThis:""}
                    PropertyChanges { target:desktopSelect; opacity:0; height:0; width:0; x:0; panelHeaderPointsize:1; showList:false;loadThis:""}
                    PropertyChanges { target:userSelect; opacity:1; height:windowHeight*0.65; width:windowWidth*0.5; x:parent.width*0.5-(width*.5);showList:true;loadThis:"Selector.qml"}

                },

                State {
                    name:"showPower"
                    PropertyChanges { target:userSelect; opacity:0; height:0; width:0; x:0; panelHeaderPointsize:1;showList:false;loadThis:""}
                    PropertyChanges { target:desktopSelect; opacity:0; height:0; width:0; x:windowWidth; panelHeaderPointsize:1; showList:false;loadThis:""}
                    PropertyChanges { target:powerSelect; opacity:1; height:windowHeight*0.65; width:windowWidth*0.5; x:windowWidth*0.5-(width*.5);showList:true;  loadThis:"PowerView.qml" }
                },

                State {
                    name:"showSession"
                    PropertyChanges { target:userSelect; opacity:0; height:0; width:0; x:windowWidth;panelHeaderPointsize:1;showList:false;loadThis:""}
                    PropertyChanges { target:powerSelect; opacity:0; height:0; width:0; x:0; panelHeaderPointsize:1;showList:false;loadThis:""}
                    PropertyChanges { target:desktopSelect; opacity:1; height:windowHeight*0.65; width:windowWidth*0.5; x:parent.width*0.5-(width*.5);showList:true;loadThis:"Selector.qml"}
                }


            ]
            transitions:Transition {
                NumberAnimation { properties:"opacity,height,x,width,panelHeaderPointsize"; duration:1100; easing.type:Easing.OutInQuart }
            }

            Panel{
                id:userSelect
                panelColour:main.backGroundTranspColour
                panelNavColour:main.finalGradient
                panelHeaderColour:main.textColour
                panelHeaderText:"User Login"
                panelHeaderPointsize:main.panelHeaderSize
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showSession"
                onGoRight:options.state = "showPower"
                loadThis:"Selector.qml"
                modelItem:userModel
                modelDelegate:UserView{}
                listViewOrientation: 1
            }

            Panel{
                id:desktopSelect
                panelColour:main.backGroundTranspColour
                panelNavColour:main.finalGradient
                panelHeaderColour:main.textColour
                panelHeaderText:"Desktop Selection"
                panelHeaderPointsize:main.panelHeaderSize
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showPower"
                onGoRight:options.state = "showUsers"
                loadThis:"Selector.qml"
                modelItem:sessionModel
                modelDelegate:SessionView{}
                listViewOrientation: 0
            }
            Panel{
                id:powerSelect
                panelColour:main.backGroundTranspColour
                panelNavColour:main.finalGradient
                panelHeaderColour:main.textColour
                panelHeaderText:"Power"
                panelHeaderPointsize:main.panelHeaderSize
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showUsers"
                onGoRight:options.state = "showSession"
                loadThis:"PowerView.qml"

            }
//            Rectangle{
//            id:testingOnly
//            x:20;y:20;
//            width:200
//            height: testWho.height+testsess.height+testpass.height
//            Text{id:testsess
//            text: sessionIndex}
//            Text{id:testpass
//                anchors.top:testsess.bottom
//            text: tempPw}
//            Text{id:testWho
//                anchors.top:testpass.bottom
//            text: tempUser}
//            }

            //            MouseArea{
            //                anchors.fill:parent
            //                enabled:true
            //                onHoveredChanged:{console.log("mouse in options")    }
            //            }
        }


    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
