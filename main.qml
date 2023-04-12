import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 1600
    height: 900
    title: qsTr("Tools Simulate Socket Signal")
    StackView {
       id: stackviewMain
       initialItem: "qrc:/Dashboard.qml"
    }
}
