import QtQuick 2.0
import QtQuick.Controls 1.2

Item {
    id: root
    width: 96; height: 96
    property color color1: "#FF5F3B"
    property color color2: color1
    property string text

    Rectangle {
        anchors.fill: parent
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.color1 }
            GradientStop { position: 1.0; color: root.color2 }
        }
        border.color: Qt.lighter(color1, 1.1)
    }
    Label {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 4
        color: '#fff'
        visible: root.text
        text: root.text
        font.pixelSize: 16
        clip: true
    }

}
