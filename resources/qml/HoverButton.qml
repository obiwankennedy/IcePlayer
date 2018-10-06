import QtQuick 2.0
//import QtQuick.Controls 2.4
import QtQuick.Templates 2.2 as T

Item {
    id: root
    property string imgNormal: ""
    property string imgHover: ""


    Image {
        anchors.fill: parent
        source: btn.hovered ? root.imgHover : root.imgNormal
    }
    T.AbstractButton {
        id: btn
        anchors.fill: parent
        hoverEnabled: true
    }
}
