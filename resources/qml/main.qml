import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4
import QtMultimedia 5.8

ApplicationWindow {
    id: root
    width: 400
    height: 600
    visible: true
    title: "IcePlayerQML"
    opacity: 0.8
    color: "transparent"
    property color textColor : "#0195FF"
    Rectangle {
        anchors.fill: parent
        color:"#d9e3ec"
        radius: 10
    }
    property bool deco: true
    flags: deco ? Qt.WindowStaysOnTopHint : Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint


    MediaPlayer {
        id: player
        onErrorStringChanged: console.log(errorString)
    }


    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Image {//logo
                sourceSize.width:120
                sourceSize.height:48
                source: "qrc:/IcePlayer/resources/images/logo.png"
                fillMode: Image.PreserveAspectFit
            }
            Item {
                Layout.fillWidth: true
            }

        }

        RowLayout {

            Layout.leftMargin: 40
            Image {
                sourceSize.height:100
                sourceSize.width:100
                source: "qrc:/IcePlayer/resources/images/default_album.jpg"
            }
            ColumnLayout {
                Text {
                    width:220
                    height:20
                    text: player.metaData.title ? player.metaData.title : "Title"
                    color: root.textColor
                }
                Text {
                    width:220
                    height:20
                    text: player.metaData.author ? player.metaData.author : "Artist"
                    color: root.textColor
                }
                Text {
                    width:220
                    height:20
                    text: player.metaData.albumTitle ? player.metaData.albumTitle : "Album"
                    color: root.textColor
                }
            }
        }
        RowLayout {
            Slider {
                id: control
                Layout.fillWidth: true
                Layout.leftMargin: 40
                to:player.duration
                from:0
                value:player.position

                background: Rectangle {
                    x: control.leftPadding
                    y: control.topPadding + control.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: control.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: "#bdbebf"

                    Rectangle {
                        width: control.visualPosition * parent.width
                        height: parent.height
                        color: "#0000BB"
                        radius: 2
                    }
                }

                handle: Rectangle {
                    x: control.leftPadding + control.visualPosition * (control.availableWidth - width)
                    y: control.topPadding + control.availableHeight / 2 - height / 2
                    implicitWidth: 10
                    implicitHeight: 10
                    radius: 5
                    color: control.pressed ? "#f0f0f0" : "#f6f6f6"
                    border.color: "#bdbebf"
                }
            }
            Text {
                property int min : player.position / 60000
                property int second : player.position / 1000 - min*60
                text: "%1:%2".arg(min).arg(second)
                color: root.textColor
            }
        }

        RowLayout {
            width: parent.width
            spacing: 15
            HoverButton {
                Layout.leftMargin: 40
                width:25
                height:25
                imgHover: "qrc:/IcePlayer/resources/images/grid.png"
                imgNormal:"qrc:/IcePlayer/resources/images/grid2.png"
            }

            HoverButton {
                width:25
                height:25
                imgHover: "qrc:/IcePlayer/resources/images/newfile.png"
                imgNormal:"qrc:/IcePlayer/resources/images/newfile2.png"
            }

            HoverButton {
                width:40
                height:40
                imgHover: "qrc:/IcePlayer/resources/images/leftarrow.png"
                imgNormal:"qrc:/IcePlayer/resources/images/arrowleft2.png"
            }

            HoverButton {
                width:61
                height:61
                imgHover: "qrc:/IcePlayer/resources/images/playbig.png"
                imgNormal:"qrc:/IcePlayer/resources/images/playbig2.png"
            }

            HoverButton {
                width:40
                height:40
                imgHover: "qrc:/IcePlayer/resources/images/rightarrow.png"
                imgNormal:"qrc:/IcePlayer/resources/images/rightarrow2.png"
            }
            HoverButton {
                width:25
                height:25
                imgHover: "qrc:/IcePlayer/resources/images/switch.png"
                imgNormal:"qrc:/IcePlayer/resources/images/switch2.png"
                onClicked: submenu.open()
                Popup {
                    id: submenu
                    ButtonGroup {
                        id: option
                        buttons: column.children
                    }
                    ColumnLayout {
                        id: column
                        anchors.fill: parent
                        spacing: 0


                        CheckBox {
                            text: qsTr("Single")
                            checkable: true
                        }
                        CheckBox {
                            text: qsTr("Repeat Single")
                            checkable: true
                        }
                        CheckBox {
                            text: qsTr("Repeat Lit")
                            checkable: true
                        }
                        CheckBox {
                            text: qsTr("Random")
                            checkable: true
                        }
                    }
                }
            }
            HoverButton {
                width:20
                height:20
                imgHover: "qrc:/IcePlayer/resources/images/earphone.png"
                imgNormal:"qrc:/IcePlayer/resources/images/earphone2.png"
            }
        }

        Rectangle {
            color: "white"
            Layout.rightMargin: 20
            Layout.leftMargin: 20
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.bottomMargin:20
            ListView {
                anchors.fill: parent
                clip: true
                model: ListModel {
                    ListElement {
                        artist: "Metallica"
                        title: "Enter Sandman"
                        time: "5:38"
                        path: "file:///media/disk-1/musique/metallica/Nouveau dossier/Metallica - Enter Sandman.mp3"
                    }
                    ListElement {
                        artist: "Metallica"
                        title: "Sad but true"
                        time: "5:32"
                        path: "file:///media/disk-1/musique/metallica/metallica/met040619d1 03 Sad But True.mp3"
                    }
                }

                delegate: Rectangle {
                    color: index % 2 == 0 ? "lightblue" : "white"
                    height:line.implicitHeight
                    width: parent.width
                    RowLayout {
                        id: line
                        anchors.fill: parent
                        Text {
                            text: title
                            Layout.preferredWidth: parent.width*0.2
                        }
                        Text {
                            text: artist
                        }
                        Text {
                            text: time
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                    MouseArea {
                        anchors.fill:parent
                        onDoubleClicked: {
                            console.log("double click:"+path)
                            player.source = path
                            player.play()
                        }
                    }
                }
            }
        }
    }
}
