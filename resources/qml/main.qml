import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4

ApplicationWindow {
    width: 400
    height: 600
    visible: true
    title: "IcePlayerQML"
    opacity: 0.8
    color: "transparent"
    Rectangle {
        anchors.fill: parent
        color:"#d9e3ec"
        radius: 20
        //opacity: 0
    }
    property bool deco: false
    flags: deco ? Qt.WindowStaysOnTopHint : Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint


    Image {//logo
        x:8
        y:3
        width:120
        height:48
        source: "qrc:/IcePlayer/resources/images/logo.png"
    }


    Image {
       x:40
       y:45
       width:100
       height:100
       source: "qrc:/IcePlayer/resources/images/default_album.jpg"
    }

    Text {
        x:150
        y:55
        width:220
        height:20
        text: "Name"
    }
    Text {
        x:150
        y:85
        width:220
        height:20
        text: "Musician"
    }
    Text {
        x:150
        y:115
        width:220
        height:20
        text: "Album"
    }

    Slider {
        x:40
        y:150
        width:290
        height:20
    }


    //RowLayout {
        HoverButton {
            x:170
            y:175
            width:61
            height:61
            imgHover: "qrc:/IcePlayer/resources/images/playbig.png"
            imgNormal:"qrc:/IcePlayer/resources/images/playbig2.png"
        }
    //}

    ListView {

    }
}
