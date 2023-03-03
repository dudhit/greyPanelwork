/***************************************************************************
* Copyleft (c) 2023 Justan O'Strawman <justanotherstrawman@gmail.com>
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

/* greeter only */
//import SddmComponents 2.0
/* qt creator only */
import "SddmComponents" as SddmComponents

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
    /* qt creator only */
    height:/*parent.height*/ 760
    width:/*parent.width*/ 1080

    /* greeter only
* TextConstants { id:textConstants }
 greeter only */
    property int sessionIndex//:session.index
    property color backGroundColour:"#ff000000"
    property color backGroundTranspColour:"#00000000"
    property color firstGradient:"#ff404040"
    property color secondGradient:"#ffc0c0c0"
    property color finalGradient:"#ffffffff"
    property color textColour:"#ff000000"
    property int windowWidth:main.width
    property int windowHeight:main.height

    Settings{
        property alias bgColour:main.backGroundColour
        property alias gradient1:main.firstGradient
        property alias gradient2:main.secondGradient
        property alias gradient3:main.finalGradient
        property alias txtColour:main.textColour
    }
    /* greeter only */

    // Connections {
    // target:sddm
    // onLoginSucceeded:{
    // }

    // onLoginFailed:{
    // // txtMessage.text = 'login Failed'
    // // listView.currentItem.password = ""
    // }
    // }

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
                    console.log("clicked background");
                    // options.focus=true ;options.state="showUsers";
                    if (options.state === "")
                    {
                        options.state="showUsers"
                    }
                    else
                    {
                        options.state=""
                    }
                }
            }

        }
        // Item {
        ListModel {
            id:mockSessionModel
            ListElement { file:"lxqt"; name:"lxqt desktop"; exec:"execlxqt"; comment:"qt based desktop";lastIndex :0}
            ListElement { file:"openbox"; name:"open box"; exec:"execobox"; comment:"meh"; lastIndex :1}
            ListElement { file:"lxdx"; name:"lxdx"; exec:"execobox"; comment:"meh2"; lastIndex :2}
            ListElement { file:"gdm"; name:"gdm"; exec:"execobox"; comment:"meh3"; lastIndex :3}
            ListElement { file:"kde"; name:"kde"; exec:"execobox"; comment:"meh4"; lastIndex :4}
        }
        ListModel {
            id:mockUserModel
            ListElement {name:"media"; realName:"multi media"; homeDir:"~/"; icon:"~/.face.icon"; lastIndex:0; lastUser:0 }
            ListElement {name:"dud"; realName:"dudhit"; homeDir:"~/"; icon:"~/.face.icon"; lastIndex:0; lastUser:0 }
        }
        ListModel {
            id:mockscreenModel
            ListElement { name:"screen"; geometry:1;primary :0}
        }

        Rectangle{
            height:3
            width:parent.width
            color:"#80808080"
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
            color:"#ff0000ff" //main.backGroundColour
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
                timeFont:"Tahoma"
                timeSize:44
                fontColour:main.firstGradient
            }
            TimeStamp{
                id:clock
                timeFont:"Tahoma"
                timeSize:44
                fontColour:main.textColour
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
            //height:100//main.windowHeight*0.66
            width:main.windowWidth
            color:"#99808080"
            anchors.verticalCenter:parent.verticalCenter
            state:"showUsers"
            onActiveFocusChanged:{
                // if (!activeFocus) options.state = ""
            }


            /* state change order showUsers>showPower>showSession */
            states:[
                State {
                    name:""
                    PropertyChanges {target:userSelect;opacity:0 ;height:0 ;width:0 ; /*modelItem:undefined;  modelDelegate:undefined;*/showList:false;}
                    PropertyChanges {target:powerSelect ;opacity:0 ;height:0 ;width:0  ; /*modelItem:undefined;  modelDelegate:undefined;*/showList:false;}
                    PropertyChanges {target:desktopSelect;opacity:0 ; height:0; width:0 ; /*modelItem:undefined;  modelDelegate:undefined;*/showList:false;}
                },
                State {
                    name:"showUsers"
                    PropertyChanges { target:userSelect; opacity:1 ; height:windowHeight*0.65; width:windowWidth*0.5 ; x:parent.width*0.5-(width*.5);showList:true; }
                    PropertyChanges { target:powerSelect; opacity:0; height:0; width:0 ; x:windowWidth; panelHeaderPointsize:1;showList:false;}
                    PropertyChanges { target:desktopSelect; opacity:0 ; height:0; width:0; x:0; panelHeaderPointsize:1; showList:false;}
                },

                State {
                    name:"showPower"
                    PropertyChanges { target:userSelect ; opacity:0 ; height:0 ; width:0 ; x:0 ; panelHeaderPointsize:1;showList:false;}
                    PropertyChanges { target:powerSelect; opacity:1; height:windowHeight*0.65; width:windowWidth*0.5; x:windowWidth*0.5-(width*.5);showList:true;  }
                    PropertyChanges { target:desktopSelect; opacity:0; height:0; width:0; x:windowWidth; panelHeaderPointsize:1; showList:false;}
                },

                State {
                    name:"showSession"
                    PropertyChanges { target:userSelect; opacity:0; height:0; width:0; x:windowWidth ;panelHeaderPointsize:1;showList:false;}
                    PropertyChanges { target:powerSelect; opacity:0; height:0; width:0; x:0; panelHeaderPointsize:1;showList:false;}
                    PropertyChanges { target:desktopSelect; opacity:1; height:windowHeight*0.65; width:windowWidth*0.5; x:parent.width*0.5-(width*.5);showList:true; }
                }
            ]
            transitions:Transition {
                NumberAnimation { properties:"opacity,height,x,width,panelHeaderPointsize"; duration:1100; easing.type:Easing.OutInQuart }
            }

            Panel{
                id:userSelect
                panelColour:backGroundTranspColour
                panelNavColour:finalGradient
                panelHeaderColour:panelHeaderColour
                panelHeaderText:"user Select"
                panelHeaderPointsize:24
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showSession"
                onGoRight:options.state = "showPower"
                modelItem:mockUserModel
                modelDelegate:UserView{}
                listViewOrientation:  ListView.Horizontal




            }

            Panel{
                id:desktopSelect
                panelColour:backGroundTranspColour
                panelNavColour:finalGradient
                panelHeaderColour:panelHeaderColour
                panelHeaderText:"desktop Select"
                panelHeaderPointsize:24
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showPower"
                onGoRight:options.state = "showUsers"
                modelItem:mockSessionModel
                modelDelegate:SessionView{}
                listViewOrientation:ListView.Vertical

            }
            StaticPanel{
                id:powerSelect
                panelColour:backGroundTranspColour
                panelNavColour:finalGradient
                panelHeaderColour:panelHeaderColour
                panelHeaderText:"power Select"//replace with sddm.hostname
                panelHeaderPointsize:30
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showUsers"
                onGoRight:options.state = "showSession"
//                modelItem:powerModel
//                modelDelegate:PowerView{}
//                listViewOrientation:ListView.Vertical
                setSource: "PowerView.qml"

            }


        }


    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
