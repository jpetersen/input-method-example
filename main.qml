import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    width: 1280
    height: 712

    visible: true

    color: "#FFE6E6E6"

    title: "Virtual Keyboard Input Example"

    Flickable {
        id: flickable

        anchors.fill: parent

        flickableDirection: Flickable.VerticalFlick

        contentHeight: textEditGrid.height
        contentWidth: textEditGrid.width

        GridTextEdit {
            id: textEditGrid
        }
    }
}
