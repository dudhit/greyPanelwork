import QtQuick 2.0
/***************************************************************************
* Copyright (c) 2013 Abdurrahman AVCI <abdurrahmanavci@gmail.com>
***************************************************************************
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


Item {
    id: container

    property date dateTime: new Date()
    property color fontColour: "white"
    property string timeFont: "Tahoma"
    property int timeSize: 24

    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: container.dateTime = new Date()
    }

    Text {
        id: time
        // anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.Top
        color: container.fontColour
        font.family: timeFont
        text : Qt.formatTime(container.dateTime, "hh:mm")+' '+Qt.formatDate(container.dateTime, Qt.DefaultLocaleLongDate)
        font.pointSize: timeSize
    }


}
