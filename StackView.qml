import QtQuick 2.15
import QtQuick.Controls 2.15
ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true



    Rectangle {
        color: "lightsteelblue"; width: 100; height: 50

        ListView {
            anchors.fill: parent
            focus: true

            model: ListModel {
                ListElement { name: "Bob" }
                ListElement { name: "John" }
                ListElement { name: "Michael" }
            }

            delegate: FocusScope {
                    width: childrenRect.width; height: childrenRect.height
                    x:childrenRect.x; y: childrenRect.y
                    TextInput {
                        focus: true
                        text: name
                        Keys.onReturnPressed: console.log(name)
                    }
            }
        }
    }


}
