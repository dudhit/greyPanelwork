import QtQuick 2.15
import QtQuick.Controls 2.15
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


Item{
    id:main
    visible:true
    implicitHeight: 108
    implicitWidth:192

    property int sessionIndex:0
    property color backGroundColour:config.backGroundColour
    property color backGroundTranspColour:config.backGroundTranspColour
    property color firstGradient:config.firstGradient
    property color secondGradient:config.secondGradient
    property color finalGradient:config.finalGradient
    property color textColour:config.textColour
    property string preferredFont:config.preferredFont
    property int windowWidth:main.width
    property int windowHeight:main.height

    Connections {
        id:greeter
        target:sddm
        function onLoginSucceeded(){
        }

        function onLoginFailed(){
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
            color:main.backGroundColour
            y:(parent.height*0.10)
            x:0
            activeFocusOnTab:false
            TimeStamp{
                id:clockShadow
                x:2
                y:2
                timeFont:preferredFont
                timeSize:44
                fontColour:main.firstGradient
            }
            TimeStamp{
                id:clock
                timeFont:preferredFont
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
            height:1
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
                panelHeaderColour:panelHeaderColour
                panelHeaderText:"User Login"
                panelHeaderPointsize:24
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
                panelHeaderColour:panelHeaderColour
                panelHeaderText:"Desktop Selection"
                panelHeaderPointsize:24
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
                panelHeaderColour:panelHeaderColour
                panelHeaderText:"Power"
                panelHeaderPointsize:24
                height:main.windowHeight*0.65
                width:main.windowWidth*0.5
                x:windowWidth*0.5-(width*.5)
                anchors.verticalCenter:parent.verticalCenter
                onGoLeft:options.state = "showUsers"
                onGoRight:options.state = "showSession"
                loadThis:"PowerView.qml"
            }
        }
    }
}
