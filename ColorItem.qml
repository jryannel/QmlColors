import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {
    id: root
    width: 128
    height: 128
    property alias color1: box.color1
    property alias color2: box.color2
    property alias title: box.text
    signal clicked()

    Box {
        id: box
        anchors.centerIn: parent
    }
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    function toCode() {
        var s = ''
        if(color1 === color2) {
            s += 'color: "' + color1 + '"\n'
            s += 'border.color: Qt.lighter(color, 1.1)\n'
        } else {
            s += 'gradient: Gradient {\n'
            s += '    GradientStop { position: 0.0; color: "%1" }\n'.arg(root.color1)
            s += '    GradientStop { position: 1.0; color: "%1" }\n'.arg(root.color2)
            s += '}\n'
        }

        return s;
    }
}
