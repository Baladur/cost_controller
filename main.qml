import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import "on_parsed.js" as Onparsed
import com.intel 1.0



//ApplicationWindow {
Rectangle {
    //title: qsTr("Контроль за расходами")
    id:app
    width: 640
    height: 350
    visible: true
    color: "white"

    Component.onCompleted: {
        console.log("we are in setView")
        for (var j=0;j<listmodels.length;j++)
            for (var i=0;i<man.getSize(j);i++)
            {
                //console.log("Next: "+i+1);

                    listmodels[j].append({
                                  "name":man.getNote(j,i).getSum()+"",
                                  "description":man.getNote(j,i).getCom(),
                                 })

            }
    }
   /* DB {
        id:ddb
        Component.onCompleted: {
            setManager(man);
            ddb.create();
            ddb.read();
        }

    }
    Manager {
        id:man
    }
    Connections {
        target:ddb
        onDataLoaded: {
            for (var j=0;j<listmodels.length;j++)
                for (var i=0;i<man.getSize(j);i++)
                {
                    //console.log("Next: "+i+1);

                        listmodels[j].append({
                                      "name":man.getNote(j,i).getSum()+"",
                                      "description":man.getNote(j,i).getCom(),
                                     })

                }
        }
    }*/
   Connections {
        target:man
        onSendNote:ddb.insert(_note)
    }

    GridView {
        id:days
        width:100
        height:340
        cellWidth: 100
        cellHeight: 50
        clip:true

        anchors {
            top:parent.top;
            left:parent.left
        }
        //interactive:true
        focus:false
        Component {
            id:daysDelegate

                Rectangle {
                    id:rect
                    width: 100
                    height: 40
                    color: GridView.isCurrentItem?"black":"lightgreen"
                    Text {
                        id:dayText
                        color: rect.GridView.isCurrentItem?"lightgreen":"black";
                        font.family: "Roman"
                        font.bold: true
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                        text:dtxt

                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: days.currentIndex=n;
                          /*
                        switch (dayText.text) {
                        case "Пн": days.currentIndex=0;break;
                        case "Вт": days.currentIndex=1;break;
                        case "Ср": days.currentIndex=2;break;
                        case "Чт": days.currentIndex=3;break;
                        case "Пт": days.currentIndex=4;break;
                        case "Сб": days.currentIndex=5;break;
                        case "Вс": days.currentIndex=6;break;
                        }  */
                    }
                }

        }
        currentIndex: man.getToday();
        model: ListModel {
            id:daymodel;
            ListElement {dtxt:"Пн";n:0}
            ListElement {dtxt:"Вт";n:1}
            ListElement {dtxt:"Ср";n:2}
            ListElement {dtxt:"Чт";n:3}
            ListElement {dtxt:"Пт";n:4}
            ListElement {dtxt:"Сб";n:5}
            ListElement {dtxt:"Вс";n:6}
        }
        delegate:daysDelegate
        onCurrentIndexChanged: {

            var index=days.currentIndex;
             console.log("index:"+index);
             console.log("currentIndex:"+currentIndex);
            listView.model=listmodels[index];



        }

    }


    EnterNote {

        id:ent
        anchors {
            bottom:parent.bottom;
            right:parent.right
        }


    }
    MyButton {
        id:save
        mytextstring: "Сохранить и выйти"
        anchors.bottom: ent.bottom
        anchors.horizontalCenter: ent.horizontalCenter
        myfunc: function() {
            man.saveData();

        }
    }

    MyButton {
        id:write
        // Component.onCompleted: {
        mytextstring:"Добавить новую запись"
        anchors.bottom: save.top
        anchors.horizontalCenter: ent.horizontalCenter
        myfunc:function(){
            if (ent._sum==""|| ent._com =="")
                notfilled.setVisible(true);
            else if (days.currentIndex>man.getToday())
                future.setVisible(true);
            else
            {
                console.log("current index:"+days.currentIndex)
                console.log("Pressed")
                if (parseFloat(ent._sum))
                {
                    man.addNote(days.currentIndex,parseFloat(ent._sum),ent._com);
                    listmodels[days.currentIndex].append({
                                      "name":man.getLast(days.currentIndex).getSum()+"",
                                      "description":man.getLast(days.currentIndex).getCom()
                                     })
                }
                else
                    notfilled.setVisible(true);
                //man.writeNote(man.getLast(days.currentIndex));

            }
         }
    }

    MessageDialog {
        id:notfilled
        title:"Внимание"
        text:"Некорректный ввод"
    }

    MessageDialog {
        id:future
        title:"Внимание"
        text:"Нельзя делать запись в будущем"
    }



    ///notes list
    //the model

    ListModel {
        id:monmodel
        ListElement {
            name:"Записи";
            description:"56"

        }
    }
    ListModel {
            id:tuesmodel
            ListElement {
                name:"Записи";
                description:""

            }
        }
    ListModel {
            id:wedmodel
            ListElement {
                name:"Записи";
                description:""

            }
        }
    ListModel {
            id:thirmodel
            ListElement {
                name:"Записи";
                description:""

            }
        }
    ListModel {
            id:frmodel
            ListElement {
                name:"Записи";
                description:""

            }
        }
    ListModel {
            id:satmodel
            ListElement {
                name:"Записи";
                description:""

            }
        }
    ListModel {
            id:sunmodel
            ListElement {
                name:"Записи";
                description:""

            }
    }
     property variant listmodels:[monmodel,tuesmodel,wedmodel,thirmodel,frmodel,satmodel,sunmodel];



    //delegate

    Component {
        id:listDelegate
        Item {
            id:delegateItem
            width:listView.width
            height:40
            clip:true
            NoteBox {
                id:nbox
                sum_text: name+"   "+description
                //com_text: description
            }

            ListView.onAdd: SequentialAnimation {
                                PropertyAction { target: delegateItem; property: "height"; value: 0 }
                                NumberAnimation { target: delegateItem; property: "height"; to: 40; duration: 250; easing.type: Easing.InOutQuad }
                            }


          /* ListView.onRemove: SequentialAnimation {
                                PropertyAction { target: delegateItem; property: "ListView.delayRemove"; value: true }
                                NumberAnimation { target: delegateItem; property: "height"; to: 0; duration: 250; easing.type: Easing.InOutQuad }

                           // Make sure delayRemove is set back to false so that the item can be destroyed
                           PropertyAction { target: delegateItem; property: "ListView.delayRemove"; value: false }
                       }*/
        }

    }

    //the view

    ListView {
        id: listView
        width:200
        height:parent.height
        anchors {
            top:parent.top;
            horizontalCenter: parent.horizontalCenter
        }

        visible:true
               /* anchors {
                    left: parent.left; top: parent.top;
                    right: parent.right;
                    margins: 20
                }*/
                model: listmodels[man.getToday()]
                delegate: listDelegate
                onModelChanged: SequentialAnimation {
                    PropertyAction {target:listDelegate.delegateItem;property:"height";value:0}
                    NumberAnimation {target:listDelegate.delegateItem;property:"height";to:20;duration:250;easing.type:Easing.InOutQuad }
                }


    }

  /*  Connections {
        target:man
        onSetView: function(){
            console.log("we are in setView")
            for (var j=0;j<listmodels.length;j++)
                for (var i=0;i<man.getSize(j);i++)
                {
                    //console.log("Next: "+i+1);

                        listmodels[j].append({
                                      "name":man.getNote(j,i).getSum()+"",
                                      "description":man.getNote(j,i).getCom(),
                                     })

                }
        }
    }*/






}
