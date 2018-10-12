import QtQuick 2.0
//import QtQuick.Controls 2.4
import QtQuick.Templates 2.2 as T

T.AbstractButton {
    id: root
    property string imgNormal: ""
    property string imgHover: ""

    hoverEnabled: true

    background: Image {
        anchors.fill: parent
        source: root.hovered ? root.imgHover : root.imgNormal
    }
}
