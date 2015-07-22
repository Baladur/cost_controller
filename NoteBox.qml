import QtQuick 2.0
import com.intel 1.0


Rectangle {
    id:note
    width: 200
    height: 30
    color:"lightblue"
    property alias sum_text:leftText.text
    //property alias com_text:rightText.text
         Text {
            id:leftText
            //width:50
            color: "black"
            font.family: "Roman"
            font.bold: true
            font.pointSize: 8
            verticalAlignment: Text.AlignVCenter
            /*anchors {
                left:parent.left
                leftMargin: 5
            }*/
         }
        /* Text {
            id:rightText
            color:"black"
            font.bold:true
            font.pointSize: 12
            verticalAlignment: Text.AlignVCenter
            anchors {
                left:leftText.right
                leftMargin:5
                right:parent.right
                rightMargin:5
            }

         }*/



}

