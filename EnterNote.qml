import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import com.intel 1.0
Rectangle {
    id:rect
    width: 200
    height: 200
    color:"#0E9EB7"
    property alias _sum:sum_input.text;
    property alias _com:com_input.text;
    Row {
        id:row
        anchors {
            top:parent.top;
            left:parent.left;
            leftMargin:10;
            topMargin: 10;
        }

        Column {
            id:text_col
            anchors.left:parent.left
            anchors.top:parent.top

           /* Text {
                anchors.topMargin:10
                color:"white"
                text:"День"
                font.family: "Roman"
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                visible: true

            }*/
            Text {
                color:"white"
                text:"Сумма"
                font.family: "Roman"
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                visible: true

            }
            Text {
                anchors.topMargin:10
                color:"white"
                text:"Описание"
                font.family: "Roman"
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 12
                visible: true

            }
        }
        Column {
            id:textfield_col
            anchors.left:text_col.right
            anchors.top:parent.top
            anchors.leftMargin:10
            /*ComboBox {
                id:cbox
                currentIndex:0
                width: 100
                model: ["Пн","Вт","Ср","Чт","Пт","Сб","Вс"];

            }*/

            TextField {
                id:sum_input
                width:50
                height:20
                enabled:true
                text:""
                visible:true

            }

            TextField {
                 id:com_input
                 anchors.topMargin:10
                 width:100
                 height:20
                 text:""
                 visible:true
            }
        }
    }





}

