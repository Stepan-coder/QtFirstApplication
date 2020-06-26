import QtQuick 2.0
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item
{
    anchors.fill: parent
    Row
    {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        RadioAction
        {
            width: parent.width / 4
            height: parent.height / 2
            anchors.verticalCenter: parent.verticalCenter
        }

        RadioTime
        {
            width: parent.width / 4
            height: parent.height / 2
            anchors.verticalCenter: parent.verticalCenter
        }

        RadioNums
        {
            width: parent.width / 4
            height: parent.height / 2
            anchors.verticalCenter: parent.verticalCenter
        }

        RadioCount
        {
            width: parent.width / 4
            height: parent.height / 2
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
