import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Rectangle
{
    id: rectAction
    property int actionIndex:  userAction
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
                color: (param == 1) ? "green" : "grey"
            }
        }

    onActionIndexChanged:
    {
        param = 1
        actionRadioButton1.checked = actionIndex == 0
        actionRadioButton2.checked = actionIndex == 1
        actionRadioButton3.checked = actionIndex == 2
        userAction = actionIndex
    }

    Column
    {
        id: radioAction
        width: rectAction.width
        Text
        {
            anchors.horizontalCenter: radioAction.horizontalCenter
            font.pixelSize: 16
            text: (language == true) ? qsTr("Operation") : qsTr("Операция")
        }

        RadioButton
        {
            id: actionRadioButton1
            checked: userAction == 0
            font.pixelSize: 14
            text: (language == true) ? qsTr("Addition") : qsTr("Сложение")
            onClicked:
            {
                actionIndex = 0
            }
        }

        RadioButton
        {
            id: actionRadioButton2
            checked: userAction == 1
            font.pixelSize: 14
            text: (language == true) ? qsTr("Subtraction") : qsTr("Вычитание")
            onClicked:
            {
                actionIndex = 1
            }
        }

        RadioButton
        {
            id: actionRadioButton3
            checked: userAction == 2
            font.pixelSize: 14
            text: (language == true) ? qsTr("Multiplication") : qsTr("Умножение")
            onClicked:
            {
                actionIndex = 2
            }
        }
    }
}
