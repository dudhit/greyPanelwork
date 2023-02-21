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
import QtQuick 2.15
import QtQuick.Controls 2.15
Pane {
    id: root

    property color panelColour: "#ff000000"
    property color panelHeaderColour: "#ffffffff"
    property color panelNavColour: "#ffffffff"
    property string panelHeaderText: "Default header"
    property int panelHeaderPointsize: 24
    //    property real navBright : 0.5
    //    property real navDim : 0.1
    property string panelFont: "Tahoma"
    //property alias focusHere:panelList.focus
    //property alias panelModel:panelList.model
    //property ListModel modelItem
    //property alias panelDelegate:panelList.delegate
    //property Component modelDelegate
    //    signal selectLeft()
    //    signal selectRight()
    // width: 500
    // height: 500
focus: true
    focusPolicy: Qt.StrongFocus
    anchors.verticalCenter: parent.verticalCenter
  background: Rectangle{color:"#00000000"}
      contentItem:  Row{
        id:panel
        GlowButton{
            id:navLeft
            height: parent.height*.5
            width:parent.width*0.05
            activeFocusOnTab: true
            onSelectNav:{console.log("clicked navLeft")}
            onHoverNav:{console.log("mouse in navLeft");forceActiveFocus()}
            onUnHoverNav:{console.log("mouse left navLeft")}
                    }
        Rectangle{
            id:content
            height: parent.height
            color: panelColour
            width:parent.width*0.8
            clip:true

            Column{
                Text{
                    id:panelHeader
                    width: content.width
                    wrapMode: Text.WordWrap
                    //  x:parent.width*0.2
                    text:panelHeaderText
                    color: panelHeaderColour
                    font.pointSize: panelHeaderPointsize
                    font.family: panelFont
                    elide:Text.ElideRight
                    MouseArea{
                        anchors.fill: parent
                        acceptedButtons: Qt.LeftButton
                        onClicked: {console.log("clicked header")
                            //         panelList.visible=true
                        }
                    }
                }
                /*
            ListView{
                id:panelList
                width:content.width
                height:  content.height
                clip:true
                focus: true
                snapMode: ListView.SnapOneItem
                keyNavigationEnabled: true
                keyNavigationWraps: true
                activeFocusOnTab: false
                onCurrentIndexChanged: {console.log("index changed to:",currentIndex)
                    //panelList.visible=(panelList.visible === true) ? false : true
                }
                onActiveFocusChanged: {
                    console.log("panelList active focus is:",activeFocus)
                }
                onFocusChanged: { console.log("panelList focus is:",focus)
                }
                highlightFollowsCurrentItem: true
                highlight: Rectangle {
                    anchors{left:parent.left;right :parent.right}

                    //anchors.fill:parent
                    color: "#ff0000ff";  }
            }
      */
            }
        }
        GlowButton{
            id:navRight
            height: parent.height*.5
            width:parent.width*0.05
            activeFocusOnTab: true
            onSelectNav:{ console.log("clicked navRight")}
            onHoverNav:{console.log("mouse in navRight");forceActiveFocus()}
            onUnHoverNav:{console.log("mouse left navRight")}

        }
    }
}
