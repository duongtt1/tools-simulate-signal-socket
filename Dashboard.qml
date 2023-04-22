import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Templates 2.2
import QtQuick.Controls.Universal 2.2
import QtQuick.Window 2.3
Item {
    width: 1600
    height: 900

    Rectangle {
        id: div_main
        x: 0
        y: 0
        width: 1600
        height: 900
        color: "#ffffff"

        Rectangle {
            id: dev_left
            x: 0
            y: 0
            width: 650
            height: 900
            color: "#faf7f7"

            Text {
                id: log_txt
                x: 16
                y: 256
                width: 192
                height: 26
                text: qsTr("Log")
                font.pixelSize: 16
            }

            Rectangle {
                id: log
                x: 16
                y: 285
                width: 626
                height: 607
                color: "#ffffff"

                TextArea {
                    id: tx_log
                    x: 8
                    y: 8
                    width: 610
                    height: 591
                    text: qsTr("")
                }
            }

            Rectangle {
                id: div_url
                x: 67
                y: 8
                width: 521
                height: 40
                color: "#ffffff"
                radius: 10
                border.width: 1

                TextInput {
                    id: url
                    x: 4
                    y: 0
                    width: 513
                    height: 40
                    text: qsTr("http://localhost:4024")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                }
            }

            Rectangle {
                id: div_token
                x: 67
                y: 70
                width: 521
                height: 40
                color: "#ffffff"
                radius: 10
                TextInput {
                    id: token
                    x: 4
                    y: 0
                    width: 518
                    height: 40
                    text: qsTr("18520651")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
                border.width: 1
            }

            Rectangle {
                id: div_btn_login
                x: 478
                y: 214
                width: 164
                height: 40
                color: "#ffffff"
                radius: 10
                border.width: 1

                MouseArea {
                    id: btn_login
                    x: 6
                    y: 0
                    width: 151
                    height: 40

                    Text {
                        id: txt_login
                        x: 8
                        y: 8
                        width: 143
                        height: 24
                        text: qsTr("Connect")
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    onClicked: {
                        SocketService.connectToSocketServer(url.text, token.text);
                    }
                }
            }

            Text {
                id: text1
                x: 8
                y: 8
                width: 53
                height: 40
                text: qsTr("URL:")
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 20
            }

            Text {
                id: text2
                x: 2
                y: 65
                width: 53
                height: 40
                text: qsTr("Token:")
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
            }

            Label {
                id: label1
                x: 113
                y: 152
            }
        }

        Rectangle {
            id: dev_sub
            x: 656
            y: 54
            width: 936
            height: 61
            color: "#f3f1f1"
            radius: 10
            border.color: "#e8e0e0"

            MouseArea {
                id: btn_sub
                x: 768
                y: 9
                width: 164
                height: 40
                onClicked: {
                    console.log("subcribed")
                    SocketService.subcribeChannel(in_channel_sub.text)
                }
            }

            Rectangle {
                id: dev_btn_sub
                x: 756
                y: 8
                width: 172
                height: 41
                color: "#ffffff"
                radius: 10
            }

            Text {
                id: label_sub
                x: 761
                y: 7
                width: 163
                height: 42
                text: qsTr("subcribe")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Text {
            id: label_section_sub
            x: 656
            y: 24
            width: 200
            height: 24
            text: qsTr("subcribe channel")
            font.pixelSize: 20
        }

        Rectangle {
            id: dev_channel
            x: 774
            y: 64
            width: 612
            height: 40
            color: "#ffffff"
            radius: 10
            TextInput {
                id: in_channel_sub
                x: 4
                y: 0
                width: 595
                height: 40
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
            }
            border.width: 1
        }

        Text {
            id: lable_channel
            x: 656
            y: 64
            width: 112
            height: 40
            text: qsTr("channel: ")
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 20
        }

        Text {
            id: l_channel_emit
            x: 656
            y: 139
            width: 200
            height: 24
            text: qsTr("emit to channel")
            font.pixelSize: 20
        }

        Rectangle {
            id: dev_emit
            x: 656
            y: 170
            width: 936
            height: 109
            color: "#f3f1f1"

            Text {
                id: lable_channel_emit_sec
                x: 8
                y: 8
                width: 112
                height: 40
                text: qsTr("channel: ")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                id: div_channel_emit_Sec
                x: 125
                y: 8
                width: 612
                height: 40
                color: "#ffffff"
                radius: 10
                TextInput {
                    id: in_channel_emit
                    x: 4
                    y: 0
                    width: 608
                    height: 40
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                }
                border.width: 1
            }

            Text {
                id: text7
                x: 36
                y: 54
                width: 84
                height: 40
                text: qsTr("data: ")
                horizontalAlignment: Text.AlignRight
                font.pixelSize: 20
                verticalAlignment: Text.AlignVCenter
            }

            Rectangle {
                id: div_username4
                x: 126
                y: 54
                width: 612
                height: 40
                color: "#ffffff"
                radius: 10
                TextInput {
                    id: data_emit
                    x: 4
                    y: 0
                    width: 595
                    height: 40
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                }
                border.width: 1
            }

            Rectangle {
                id: rectangle5
                x: 756
                y: 8
                width: 172
                height: 41
                color: "#ffffff"
                radius: 10

                MouseArea {
                    id: mouseArea2
                    x: 0
                    y: 0
                    width: 172
                    height: 41

                    Text {
                        id: text8
                        x: 8
                        y: 0
                        width: 156
                        height: 41
                        text: qsTr("Send")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pixelSize: 20
                    }
                    onClicked: {
                        SocketService.emitToChannel(in_channel_emit.text, data_emit.text)
                    }
                }
            }
        }

        Label {
            id: label
            x: 656
            y: 285
            width: 143
            height: 24
            text: qsTr("Stream RTSP ")
            font.pointSize: 16
        }

        Rectangle {
            id: rectangle
            x: 656
            y: 315
            width: 936
            height: 133
            color: "#f3f1f1"
            radius: 10
            border.width: 0

            Text {
                id: lable_channel_emit_sec1
                x: 15
                y: 24
                width: 112
                height: 36
                text: qsTr("url")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 20
            }

            Rectangle {
                id: rectangle2
                x: 752
                y: 24
                width: 164
                height: 43
                color: "#ffffff"
                radius: 15

                Text {
                    id: text3
                    x: 8
                    y: 8
                    width: 148
                    height: 27
                    text: qsTr("Start")
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 18
                }

                MouseArea {
                    id: btn_start
                    x: 0
                    y: 0
                    width: 164
                    height: 43
                    onClicked: {
                        SysCrtl.startStreamRTSP(ta_url.text)
                        //                        console.log(ta_url.text)
                    }
                }
            }

            Rectangle {
                id: rectangle3
                x: 752
                y: 85
                width: 164
                height: 37
                color: "#ffffff"
                radius: 10

                Label {
                    id: label2
                    x: 64
                    y: 8
                    text: qsTr("End")
                    font.pointSize: 16
                }

                MouseArea {
                    id: end_btn
                    x: 0
                    y: 0
                    width: 164
                    height: 37
                    onClicked: {
                        SysCrtl.endStreamRTSP()
                    }
                }
            }
        }

        Rectangle {
            id: rectangle1
            x: 774
            y: 335
            width: 612
            height: 48
            color: "#ffffff"
            radius: 10

            TextArea {
                id: ta_url
                x: 8
                y: 8
                width: 596
                height: 31
                text: qsTr("rtsp://localhost:8554/live")
            }
        }
    }

    Connections {
        target: SocketService

        onShowLog: {
            if (tx_log.text != "")
                tx_log.text += "\n"
            tx_log.text += log
        }
    }
}
