import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Rectangle
{
    id: rectTime
    property int countIndex: userCount
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
                color: (param == 4) ? "green" : "grey"
            }
        }

    onCountIndexChanged:
    {
        param = 4
        countRadioButton1.checked = countIndex == 0
        countRadioButton2.checked = countIndex == 1
        countRadioButton3.checked = countIndex == 2
        countRadioButton4.checked = countIndex == 3
        countRadioButton5.checked = countIndex == 4
        userCount = countIndex
    }

    Column
    {
        id: radioCount
        width: rectTime.width
        Text
        {
            anchors.horizontalCenter: radioCount.horizontalCenter
            font.pixelSize: 16
            text: (language == true) ? qsTr("Operation count") : qsTr("Количество операций")
        }

        RadioButton
        {
            id: countRadioButton1
            checked: userCount == 0
            font.pixelSize: 14
            text: qsTr("5")
            onClicked:
            {
                countIndex = 0
            }
        }

        RadioButton
        {
            id: countRadioButton2
            checked: userCount == 1
            font.pixelSize: 14
            text: qsTr("10")
            onClicked:
            {
                countIndex = 1
            }
        }

        RadioButton
        {
            id: countRadioButton3
            checked: userCount == 2
            font.pixelSize: 14
            text: qsTr("15")
            onClicked:
            {
                countIndex = 2
            }
        }

        RadioButton
        {
            id: countRadioButton4
            checked: userCount == 3
            font.pixelSize: 14
            text: qsTr("20")
            onClicked:
            {
                countIndex = 3
            }
        }

        RadioButton
        {
            id: countRadioButton5
            checked: userCount == 4
            font.pixelSize: 14
            text: qsTr("25")
            onClicked:
            {
                countIndex = 4
            }
        }
    }
}
