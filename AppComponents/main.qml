import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window
{
    id: window
    visible: true
    width: 720
    height: 480
    minimumWidth: 720
    minimumHeight: 480
    title: "QML Application"
    property bool settingsGame: false
    property bool language: true
    property int userAction: 0
    property int userCount: 4
    property int userNums: 0
    property int userTime: 0
    property int param: 1
    Loader
    {
        id: pageLoader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: settingsGameRow.top
        source: settingsGame ? "qrc:/Settings.qml" : "qrc:/Game.qml"
    }

    Row
    {
        id: settingsGameRow
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        bottomPadding: 10
        spacing: 5

        ClickableText
        {
            id: settingsText
            text: (language == true) ? qsTr("Settings") : qsTr("Настройки")
            font.underline: settingsGame
            onClicked:
            {
                settingsGame = true
            }
        }

        Text
        {
            id: txtSlash
            color: "black"
            text: "/"
            font.pixelSize: 20
            visible: true
        }

        ClickableText
        {
            id: gameText
            text: (language == true) ? qsTr("Game") : qsTr("Игра")
            font.underline: !settingsGame
            onClicked:
            {
                settingsGame = false
            }
        }
    }

    Row
    {
        id: langRow
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 5

        Text
        {
            id: en
            anchors.verticalCenter: parent.verticalCenter
            color: "black"
            font.pixelSize: 16
            text: qsTr("EN")
        }

        Switch
        {
            id: langSwitch
            onClicked:
            {
                language = !language
            }
        }

        Text
        {
            id: ru
            anchors.verticalCenter: parent.verticalCenter
            color: "black"
            font.pixelSize: 16
            text: qsTr("RU")
        }
    }
}
