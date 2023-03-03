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
import QtQuick 2.12
import QtQuick.Controls 2.12

FocusScope{
    id:root

    property color panelColour: "#ff000000"
    property color panelHeaderColour: "#ffffffff"
    property color panelNavColour: "#ffffffff"
    property string panelHeaderText: "Default header"
    property int panelHeaderPointsize: 24
    property string panelFont: "Tahoma"
//    property ListModel modelItem
//    property Component modelDelegate
//    property string listViewOrientation
    property alias showList: contentLoader.active
    property alias setSource: contentLoader.source
    signal goLeft()
    signal goRight()
    implicitWidth: 900
    implicitHeight: 500
    clip: true
    Rectangle{
        id: panel
        color: "#00808080"
        anchors.fill:parent

        Row {
            id: row
            anchors.fill:parent

            GlowButton {
                id:navLeft
                width: panel.width*0.1
                height: panel.height*0.5
                y:panel.height*0.25
                buttonColour: panelNavColour
                activeFocusOnTab: contentLoader.active
                KeyNavigation.right:content
                onSelectNav:{/*console.log("clicked navLeft");*/goLeft();}
             //   onHoverNav:{console.log("mouse in navLeft");}
             //   onUnHoverNav:{console.log("mouse left navLeft");}
            }

            Rectangle {
                id:content
                width: panel.width*0.8
                height: panel.height
                color: panelColour
                clip:true
                activeFocusOnTab: contentLoader.active
                Column{
                    Text{
                        id:panelHeader
                        width: content.width
                        wrapMode: Text.WordWrap
                        text:panelHeaderText
                        color: panelHeaderColour
                        font.pointSize: panelHeaderPointsize
                        font.family: panelFont
                        elide:Text.ElideRight
                    }
                    Rectangle{
                        width: content.width
                        height: content.height-panelHeader.height
                        color: panelColour
                        Loader{
                            id:contentLoader
                            anchors.fill:parent
                            activeFocusOnTab: true
                            focus: true
                            onLoaded:{
//                                item.model=root.modelItem;
//                                item.delegate=root.modelDelegate;
//                                item.flow=root.listViewOrientation
//                                modelBinding.target=contentLoader.item;
//                                delegateBinding.target=contentLoader.item;
//                                forceActiveFocus();
                            }
                            onStateChanged: {panelHeader.text=status}
                            /*



*/
                            MouseArea{
                                anchors.fill: parent
                                enabled: true
                                hoverEnabled:true
                                // acceptedButtons: Qt.LeftButton
                                onClicked: {/*console.log("contentLoader Clicked");*/}
                                onEntered: {contentLoader.forceActiveFocus();/*console.log("contentLoader entered");*/}
                                onExited: {/*console.log("contentLoader exited");*/}
                            }
                        }




                    }

                }

            }

            GlowButton {
                id:navRight
                width: panel.width*0.1
                height: panel.height*0.5
                y:panel.height*0.25
                buttonColour: panelNavColour
                activeFocusOnTab: contentLoader.active
                KeyNavigation.left:content
                onSelectNav:{/*console.log("clicked navRight");*/goRight();}
              //  onHoverNav:{console.log("mouse in navRight");}
              //  onUnHoverNav:{console.log("mouse left navRight");}
            }
        }

    }
}





