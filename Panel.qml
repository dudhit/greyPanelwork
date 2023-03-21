import QtQuick 2.12
import QtQuick.Controls 2.12
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

    property color panelColour:"#ff000000"
    property color panelHeaderColour:"#ffffffff"
    property color panelNavColour:"#ffffffff"
    property string panelHeaderText:"Default header"
    property int panelHeaderPointsize:24
    property string panelFont:"Tahoma"
    property ListModel modelItem
    property Component modelDelegate
    property int listViewOrientation
    property bool showList:false
    property string loadThis
    signal goLeft()
    signal goRight()
    implicitWidth:900
    implicitHeight:500
    clip:true
    Rectangle{
        id:panel
        color:panelColour
        anchors.fill:parent

        Row{
            id:row
            anchors.fill:parent
            spacing:0
            GlowButton {
                id:navLeft
                width:panel.width*0.05
                height:panel.height*0.5
                y:panel.height*0.25
                buttonColour:panelNavColour
                activeFocusOnTab:showList
                KeyNavigation.tab:panelLoader
                KeyNavigation.backtab:navRight
                onSelectNav:{goLeft();}
            }

            Rectangle {
                id:content
                width:panel.width*0.9
                height:panel.height
                color:panelColour
                onActiveFocusChanged:
                {
                    if (activeFocus===true)
                    {forceActiveFocus(panelLoader);}
                }

                Column{
                    spacing:0
                    Text{
                        id:panelHeader
                        width:content.width
                        wrapMode:Text.WordWrap
                        text:panelHeaderText
                        color:panelHeaderColour
                        font.pointSize:panelHeaderPointsize
                        font.family:panelFont
                        elide:Text.ElideRight
                    }
                    Loader{
                        id:panelLoader
                        width:content.width
                        height:content.height-panelHeader.height
                        source:loadThis
                        KeyNavigation.tab:navRight
                        KeyNavigation.backtab:navLeft
                        active: showList;
                        activeFocusOnTab:showList
                        onLoaded:{
                            item.activeFocusOnTab=showList;
                            if (modelItem)
                            {
                                item.model=modelItem;
                            }
                            if (modelDelegate)
                            {
                                item.modelView=modelDelegate;
                            }
                            if (listViewOrientation)
                            {
                                item.flow=listViewOrientation;
                            }
//                           forceActiveFocus(item)
                         }
                    }
                }
            }
            GlowButton {
                id:navRight
                width:panel.width*0.05
                height:panel.height*0.5
                y:panel.height*0.25
                buttonColour:panelNavColour
                activeFocusOnTab:showList
                KeyNavigation.tab:navLeft
                KeyNavigation.backtab:panelLoader
                onSelectNav:{goRight();}
            }

        }

    }
}


