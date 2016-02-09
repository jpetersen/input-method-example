import QtQuick 2.5

FocusScope {
    id: focusScope

    property string fontFamily: "open sans light"
    property alias value: textInput.text;
    property int fontSize: 27
    property alias textColor: textInput.color;
    property alias backgroundText: typeSomething.text;
    property alias icon: iconSource.source
    property alias inputMethodHints: textInput.inputMethodHints

    height: 48

    Rectangle {
        id: background;
        anchors.fill: parent
        radius: 13
        antialiasing: true
        border {
            width: 1
            color: focusScope.activeFocus ? "#FF14ABBE" : "#FF808080"
        }

        Image {
            id: backgroundAsset

            height: parent.height
            width: 52

            anchors {
                left: parent.left
                top: parent.top
            }

            source: focusScope.activeFocus ? "Images/asset_iconholderON.png" : "Images/asset_iconholder.png"
        }

        Image {
            id: iconSource

            height: parent.height
            width: 52

            anchors {
                left: parent.left
                top: parent.top
            }
        }
    }

    TextInput {
        id: textInput;

        focus: true
        selectByMouse: true
        font {
            pixelSize: fontSize
            family:  fontFamily
        }

        wrapMode: TextEdit.NoWrap
        color: focusScope.activeFocus ? "#FF14ABBE" : "#FF808080"
        anchors {
            fill: parent
            leftMargin: 68
            rightMargin: 68
        }

	verticalAlignment: TextInput.AlignVCenter

	clip: true
    }

    Text {
        id: typeSomething;

        text: "Type something..."
        color: "#FF808080"
        opacity: ((value === "" && !textInput.inputMethodComposing) ? 1.0 : 0.0);
        font {
            family: fontFamily
            pixelSize: fontSize
        }

        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 68
            verticalCenter: parent.verticalCenter;
        }

        Behavior on opacity { NumberAnimation { duration: 250; } }
    }

    MouseArea {
        enabled: !focusScope.activeFocus
        anchors.fill: parent
        onClicked: textInput.forceActiveFocus()
    }

    Image {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        source: "Images/icon_clear.png"

        Behavior on opacity { NumberAnimation { duration: 250; } }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                value = "";
		textInput.focus = false
                textInput.forceActiveFocus()
            }
        }
    }
}
