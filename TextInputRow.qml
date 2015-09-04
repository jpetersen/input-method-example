import QtQuick 2.0

Rectangle {
    id: root

    property alias text: label.text
    property alias inputMethodHints: input.inputMethodHints

    border.color: "black"
    border.width: 1
    radius: 5

    implicitHeight: Math.max(label.height, input.height) + label.anchors.margins * 2

    Text {
        id: label

        font.pixelSize: 16

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 5
    }

    TextInput {
        id: input

        font.pixelSize: 16

        anchors.left: label.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: 5
    }
}

