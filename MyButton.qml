import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
Rectangle {
    id:mybutton
    width: 100
    height: 20
    scale:1
    property color dark:Qt.darker("#0E9EB7")
    color:"#0E9EB7"
    property color light:"#0E9EB7"
    property color hover: Qt.lighter("#0E9EB7")
    property alias mytextstring: mytext.text
    property var myfunc
        Text {
            id: mytext
            color:"white"
            font.pointSize: 12
            text:""
            verticalAlignment: Text.AlignVCenter
            //font.family: "Roman"
            //verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            Behavior on font.pixelSize {
                NumberAnimation { easing.type: Easing.InQuad;duration:100}

            }
        }
    Behavior on color {
        ColorAnimation {duration:100}

    }
    Behavior on scale {
        NumberAnimation { easing.type: Easing.InQuad;duration:100}
    }
    /*Behavior on height {
        NumberAnimation { easing.type: Easing.InQuad;duration:100}
    }*/
    Behavior on x {
        NumberAnimation { easing.type: Easing.InQuad;duration:100}
    }
    Behavior on y {
        NumberAnimation { easing.type: Easing.InQuad;duration:100}
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onPressed:{
            mybutton.color=dark;
            mybutton.scale=0.95;
            //mybutton.height=62/1.1;
            //mybutton.x+=5;
            //mybutton.y+=3.1
            mytext.text.pixelSize=15
            myfunc()
        }
    }
     states: [State {
            name:"out pressed"
            when:!mouse.containsMouse&&mouse.pressed
            PropertyChanges {
                target:mybutton
                color:"#0E9EB7"
                scale:1

            }

        },
        State {
            name:"mouse rel"
            when:!mouse.pressed
            PropertyChanges {
                target:mybutton
                color:"#0E9EB7"
                scale:1
        }
    },
            State {
                name:"mouse pres"
                when:mouse.pressed
                PropertyChanges {
                    target:mybutton
                    color:dark
                    scale:0.95
            }

        }]



}



