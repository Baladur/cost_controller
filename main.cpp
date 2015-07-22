#include <QApplication>
#include <QObject>
#include <QQmlComponent>
#include <QtQuick>

#include <QQmlApplicationEngine>
#include "manager.h"
#include "note.h"
//#include "db.h"
//int Manager::lastId;
//int Manager::lastSavedId;
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    //qmlRegisterType<db>("com.intel",1,0,"DB");
    qmlRegisterType<Manager>("com.intel", 1, 0, "Manager");
    qmlRegisterType<Note>("com.intel", 1, 0, "Note");

    //QQmlApplicationEngine engine;
    QQuickView view;

    Manager man;

    //qRegisterMetaType<Note *>("Note *");
    //QObject::connect(man,SIGNAL(sendNote(Note*)),ddb,SLOT(insert(Note*)));
    //QObject::connect(ddb,SIGNAL(dataLoaded(void)),man,SIGNAL(setView(void)));

    view.rootContext()->setContextProperty("man",&man);
    //view.rootContext()->setContextProperty("ddb",ddb);
     view.setSource(QUrl("qrc:/main.qml"));
    view.show();
    //engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
