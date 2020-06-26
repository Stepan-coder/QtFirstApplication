import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Rectangle
{
    id: rectTime
    property int numsIndex: userNums
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
                color: (param == 3) ? "green" : "grey"
            }
        }

    onNumsIndexChanged:
    {
        param = 3
        numsRadioButton1.checked = numsIndex == 0
        numsRadioButton2.checked = numsIndex == 1
        numsRadioButton3.checked = numsIndex == 2
        numsRadioButton4.checked = numsIndex == 3
        numsRadioButton5.checked = numsIndex == 4
        userNums = numsIndex
    }

    Column
    {
        id: radioNums
        width: rectTime.width
        Text
        {
            anchors.horizontalCenter: radioNums.horizontalCenter
            font.pixelSize: 16
            text: (language == true) ? qsTr("Count nums") : qsTr("Количество цифр")
        }

        RadioButton
        {
            id: numsRadioButton1
            checked: userNums == 0
            font.pixelSize: 14
            text: qsTr("1 (_)")
            onClicked:
            {
                numsIndex = 0
            }
        }

        RadioButton
        {
            id: numsRadioButton2
            checked: userNums == 1
            font.pixelSize: 14
            text: qsTr("2 (_ _)")
            onClicked:
            {
                numsIndex = 1
            }
        }

        RadioButton
        {
            id: numsRadioButton3
            checked: userNums == 2
            font.pixelSize: 14
            text: qsTr("3 (_ _ _)")
            onClicked:
            {
                numsIndex = 2
            }
        }

        RadioButton
        {
            id: numsRadioButton4
            checked: userNums == 3
            font.pixelSize: 14
            text: qsTr("4 (_ _ _ _)")
            onClicked:
            {
                numsIndex = 3
            }
        }

        RadioButton
        {
            id: numsRadioButton5
            checked: userNums == 4
            font.pixelSize: 14
            text: qsTr("5 (_ _ _ _ _)")
            onClicked:
            {
                numsIndex = 4
            }
        }
    }
}
