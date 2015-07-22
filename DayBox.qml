import QtQuick 2.0

Rectangle {
    id:rect
    width: 100
    height: 40
    color: "#9f2b0a"
    property alias day_text:dayText.text
    property alias day_color:rect.color
    property alias day_textcolor:dayText.color
    Text {
        id:dayText
        color: "black"
        font.family: "Roman"
        font.bold: true
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12

    }
}

