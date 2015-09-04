import QtQuick 2.4

import QtQuick.Layouts 1.1

Rectangle {
    width: 360
    height: 360

    Flickable {
        id: flickable

        anchors.fill: parent

        contentHeight: column.height

        Column {
            id: column

            anchors.left: parent.left
            anchors.right: parent.right

            spacing: 5

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Normal")
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Password")
                inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText | Qt.ImhSensitiveData | Qt.ImhHiddenText
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Uppercase")
                inputMethodHints: Qt.ImhPreferUppercase
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Lowercase")
                inputMethodHints: Qt.ImhPreferLowercase
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Digits")
                inputMethodHints: Qt.ImhDigitsOnly
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Numbers")
                inputMethodHints: Qt.ImhFormattedNumbersOnly
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Phone")
                inputMethodHints: Qt.ImhDialableCharactersOnly
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Email")
                inputMethodHints: Qt.ImhEmailCharactersOnly
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("URL")
                inputMethodHints: Qt.ImhUrlCharactersOnly
            }

            TextInputRow {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                text: qsTr("Date")
                inputMethodHints: Qt.ImhDate
            }

            Item {
                anchors.left: parent.left
                anchors.right: parent.right

                height: flickable.height
            }

//            TextInputRow {
//                anchors.left: parent.left
//                anchors.right: parent.right
//                anchors.margins: 5

//                text: qsTr("Latin")
//                inputMethodHints: Qt.ImhLatinOnly
//            }
        }
    }
}
