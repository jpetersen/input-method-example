import QtQuick 2.5
import QtQuick.Window 2.2

Item {
    id: root

    width: Window.width
    height: firstColumn.implicitHeight + (!twoColumns ? (secondColumn.implicitHeight + 103) : 0) + 110 + 500

    property int leftMargin: Window.width >= 1280 - 56 ? 75 : 31
    property int rightMargin: 130

    property int columnSpacing: Window.width >= 1200 ? 108 : 36

    property bool twoColumns: Window.width > (Screen.width / 2)

    property int leftColumnWidth: twoColumns ? (Window.width - leftMargin - rightMargin - columnSpacing) * 0.6 : Window.width - leftMargin - rightMargin
    property int rightColumnWidth: twoColumns ? (Window.width - leftMargin - rightMargin - columnSpacing) * 0.4 : leftColumnWidth

    Grid {
        id: grid

        anchors.topMargin: 55
        anchors.bottomMargin: 55 + 500 // TODO get size of virtual keyboard
        anchors.leftMargin: root.leftMargin
        anchors.fill: parent

        columns: root.twoColumns ? 2 : 1
        rowSpacing: root.twoColumns ? 0 : 103
        columnSpacing: root.columnSpacing
        focus: true

        Column {
            id: firstColumn
            width: root.leftColumnWidth
            spacing: 48

            Repeater {
                id: repeat

                model: leftListModel
                delegate: Loader {
                    readonly property var modelData: model

                    width: parent.width
                    sourceComponent: model.separator ? separatorComponent : editorComponent
                }
            }
        }

        Column {
            id: secondColumn

            width: root.rightColumnWidth
            spacing: 48

            Repeater {
                id: repSecondColumn

                model: rightListModel
                delegate: Loader {
                    readonly property var modelData: model

                    width: parent.width
                    sourceComponent: editorComponent
                }
            }
        }
    }

    ListModel {
        id: leftListModel

        ListElement { label: "Normal"; source: "Images/icon_normal.png"; inputMethodHints: Qt.ImhNone }
        ListElement { label: "Uppercase"; source: "Images/icon_upper.png"; inputMethodHints: Qt.ImhPreferUppercase }
        ListElement { label: "Lowercase"; source: "Images/icon_lower.png"; inputMethodHints: Qt.ImhPreferLowercase }
        ListElement { separator : true }
        ListElement { label: "Phone"; source: "Images/icon_phone.png"; inputMethodHints: Qt.ImhDialableCharactersOnly }
        ListElement { label: "URL"; source: "Images/icon_url.png"; inputMethodHints: Qt.ImhUrlCharactersOnly }
        ListElement { label: "Email"; source: "Images/icon_mail.png"; inputMethodHints: Qt.ImhEmailCharactersOnly }
    }

    ListModel {
        id: rightListModel

        ListElement { label: "Password"; source: "Images/icon_password.png" }
        ListElement { label: "Digits"; source: "Images/icon_digits.png"; inputMethodHints: Qt.ImhDigitsOnly }
        ListElement { label: "Numbers"; source: "Images/icon_numbers.png"; inputMethodHints: Qt.ImhFormattedNumbersOnly }
        ListElement { label: "Date"; source: "Images/icon_date.png"; inputMethodHints: Qt.ImhDate }

        Component.onCompleted: rightListModel.setProperty(0, "inputMethodHints", Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText | Qt.ImhSensitiveData | Qt.ImhHiddenText)
    }

    Component {
        id: separatorComponent

        Item { width: parent.width; height: 5 }
    }

    Component {
        id: editorComponent

        FocusBoxTextEdit {
            width: parent.width
            backgroundText: modelData.label
            icon: modelData.source
            inputMethodHints: modelData.inputMethodHints
        }
    }
}
