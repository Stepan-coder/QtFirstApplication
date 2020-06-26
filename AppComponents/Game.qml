import QtQuick 2.0
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.1
import Logic 1.0

Item
{
    anchors.fill: parent
    Logic
    {
        id: myLogic
        onTaskStringChanged:
        {
            taskText.text = myLogic.taskString
        }

        onMathProcessingChanged:
        {
            checkButton.visible = !checkButton.visible
        }
    }

    MessageDialog
   {
       id: m_dialog
       title: ""
       text: ""
   }

    Rectangle
    {
        id: showRect
        width: parent.width / 2
        height: parent.height / 2
        anchors.left: parent.left
        anchors.leftMargin: (parent.width / 2 )* 0.05
        anchors.verticalCenter: parent.verticalCenter
        border.color: "black"
        border.width: 1
        Text
        {
            id: taskText
            anchors.centerIn: parent
            color: "black"
            font.pixelSize: (parent.width / 2)* 0.2
            text: qsTr(myLogic.taskString)
        }
    }

    TextField
    {
        id: answer
        anchors.top: showRect.top
        anchors.left: showRect.right
        anchors.leftMargin: (parent.width / 2)* 0.05
        anchors.right: parent.right
        anchors.rightMargin: (parent.width / 2)* 0.05
        placeholderText:  (language == true) ? qsTr("Answer") : qsTr("Ответ")
        font.pixelSize: 20
    }

    Button
    {
        id: checkButton
        anchors.top:  answer.bottom
        anchors.topMargin: (parent.width / 2)* 0.05
        anchors.left: showRect.right
        anchors.leftMargin: (parent.width / 2)* 0.05
        anchors.right: parent.right
        anchors.rightMargin: (parent.width / 2)* 0.05
        text: (language == true) ? qsTr("Verify") : qsTr("Проверить")
        onClicked:
        {
            if (myLogic.answer != answer.text)
            {
                m_dialog.visible = true
                m_dialog.title = "Неверно!"
                m_dialog.text = "Неверно!"
            }
            else
            {
                m_dialog.visible = true
                m_dialog.title = "Верно!"
                m_dialog.text = "Верно!"
            }
            answer.clear()
        }
    }

    Button
    {
        id: startButton
        anchors.top:  checkButton.bottom
        anchors.topMargin: (parent.width / 2)* 0.05
        anchors.left: showRect.right
        anchors.leftMargin: (parent.width / 2)* 0.05
        anchors.right: parent.right
        anchors.rightMargin: (parent.width / 2)* 0.05
        text: (language == true) ? qsTr("Start") : qsTr("Начать")
        onClicked:
        {
            myLogic.master(userAction, userNums, userTime, userCount)
        }
    }
}
