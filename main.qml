import QtQuick 2.1
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import "colors.js" as Colors

ApplicationWindow {
    id: root
    visible: true
    title: 'QmlColors'
    width: 800
    height: 600

    Rectangle {
        anchors.fill: parent
        color: '#333'
    }


    SplitView {
        anchors.fill: parent
        orientation: Qt.Vertical
        handleDelegate: Item {
            height: root.height/24
            Rectangle {
                anchors.fill: parent
                color: '#fff'
                opacity: 0.1
            }

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                height: 1
                color: '#fff'
                opacity: 0.5
            }
        }

        GridView {
            id: view
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: colorModel
            cellWidth: 128
            cellHeight: 128
            focus: true
            delegate: ColorItem {
                color1: model.color1
                color2: model.color2
                title: model.title
                onClicked: {
                    out.text = toCode()
                    out.copyAll()
                    view.currentIndex = index

                }
            }
            highlightFollowsCurrentItem: false
            highlight: Rectangle {
                x: view.currentItem.x
                y: view.currentItem.y
                width: view.currentItem.width
                height: view.currentItem.height
                Behavior on x {
                    NumberAnimation {
                        duration: 75; easing.type: Easing.InOutSine
                    }
                }
                Behavior on y {
                    NumberAnimation {
                        duration: 75; easing.type: Easing.InOutSine
                    }
                }
                opacity: 0.8
                color: '#666'
                border.color: Qt.lighter(color, 1.2)
            }
            clip: true
        }

        RowLayout {
            Layout.fillWidth: true
            height: root.height*0.25
            spacing: 8
            TextArea {
                id: out
                readOnly: true
                Layout.fillWidth: true
                Layout.fillHeight: true
                textColor: '#5fc9f8'
                backgroundVisible: false
                textMargin: 8

                function copyAll() {
                    out.selectAll()
                    out.copy()
                    out.select(0,0)
                }
            }
            Button {
                text: 'Copy'
                Layout.alignment: Qt.AlignTop
                onClicked: {
                    out.copyAll()
                }
            }
        }
    }



    ListModel {
        id: colorModel
    }

    Component.onCompleted: {
        var length = Colors.data.length
        for(var i=0; i<length; i++) {
            var entry = Colors.data[i]
            if(entry.color1 === undefined) {
                entry.color1 = '#000'
            }
            if(entry.color2 === undefined) {
                entry.color2 = entry.color1
            }
            if(entry.title === undefined) {
                entry.title = ''
            }
            colorModel.append(entry);
        }
    }
}
