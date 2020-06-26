import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Rectangle
{
    id: rectTime
    property int timeIndex: userTime
    width: parent.width
    height: parent.height
    border.color: "black"
    border.width: 1
    radius: Math.min(parent.width, parent.height) / 50
    gradient:
        Gradient
        {
            GradientStop
            {
                position: 0.0
                color: "white"
            }
            GradientStop
            {
                position: 1.0
                color: (param == 2) ? "green" : "grey"
            }
        }

    onTimeIndexChanged:
    {
        param = 2
        timeRadioButton1.checked = timeIndex == 0
        timeRadioButton2.checked = timeIndex == 1
        timeRadioButton3.checked = timeIndex == 2
        timeRadioButton4.checked = timeIndex == 3
        timeRadioButton5.checked = timeIndex == 4
        userTime = timeIndex
    }

    Column
    {
        id: radioTime
        width: rectTime.width
        Text
        {
            anchors.horizontalCenter: radioTime.horizontalCenter
            font.pixelSize: 16
            text: (language == true) ? qsTr("Time") : qsTr("Время")
        }

        RadioButton
        {
            id: timeRadioButton1
            checked: userTime == 0
            font.pixelSize: 14
            text: (language == true) ? qsTr("10 seconds") : qsTr("10 секунд")
            onClicked:
            {
                timeIndex = 0
            }
        }

        RadioButton
        {
            id: timeRadioButton2
            checked: userTime == 1
            font.pixelSize: 14
            text: (language == true) ? qsTr("5 seconds") : qsTr("5 секунд")
            onClicked:
            {
                timeIndex = 1
            }
        }

        RadioButton
        {
            id: timeRadioButton3
            checked: userTime == 2
            font.pixelSize: 14
            text: (language == true) ? qsTr("3 seconds") : qsTr("3 секунды")
            onClicked:
            {
                timeIndex = 2
            }
        }

        RadioButton
        {
            id: timeRadioButton4
            checked: userTime == 3
            font.pixelSize: 14
            text: (language == true) ? qsTr("1 second") : qsTr("1 секунда")
            onClicked:
            {
                timeIndex = 3
            }
        }

        RadioButton
        {
            id: timeRadioButton5
            checked: userTime == 4
            font.pixelSize: 14
            text: (language == true) ? qsTr("1/2 second") : qsTr("1/2 секунды")
            onClicked:
            {
                timeIndex = 4
            }
        }
    }
}
