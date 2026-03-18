import QtQuick 2.0
import QtQuick.Controls 2.12

Button {
    id: btn
    property string _text: "button"

    property string _color: "#ff0000"
    property string _color_hovered: "#ffffff"

    property string _color_bg: "#ffffff"
    property string _color_bg_hovered: "#ff0000"

    signal clicked(string msg)

    MouseArea {
        anchors.fill: parent
        onExited: {
            __rect.color = _color_bg
            __text.color = _color
        }
        onEntered: {
            __rect.color = _color_bg_hovered
            __text.color = _color_hovered
        }
        onClicked: {
            btn.clicked("")
        }
        hoverEnabled: true
    }

    contentItem: Text {
        id: __text
        font.family: 'Microsoft Yahei'
        text: _text
        color: _color
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
    }

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        color: "transparent"
        border.width: 2
        border.color: "#2ce0dd"
        radius: 4
    }

    background: Rectangle {
        Behavior on color {
            ColorAnimation {
                duration: 200
            }
        }
        anchors.centerIn: parent
        width: parent.width - 4
        height: parent.height - 4
        id: __rect
        color: _color_bg
        radius: 2
    }
}
