import QtQuick 2.12
import QtQuick.Window 2.12
import "./"

Window {
    id: window
    visible: true
    width: 640
    height: 480

    title: qsTr("Hello World")

    Text {
        width: 2
        height: 20
        id: text
        text: "idle"
    }

    MButton {
        width: 60
        height: 40
        _text: "hello"
        onClicked: {
            let res = EventBridge.invoke("onclick", "10")
            _text = "ok"
        }
    }
    Connections {
        target: EventBridge
        function onAsyncFinished(event, result) {
            console.log("event:" + event + " result:" + result)
        }
    }
}
