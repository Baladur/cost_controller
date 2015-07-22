TEMPLATE = app

QT += qml quick widgets
QT +=  core declarative

CONFIG += c++11
CONFIG += qml_debug
SOURCES += main.cpp \
    note.cpp \
    manager.cpp \
    dropdownlist.cpp \
    sqlite3.c \
    db.cpp

RESOURCES += qml.qrc


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    note.h \
    manager.h \
    dropdownlist.h \
    sqlite3.h \
    db.h

DISTFILES += \
    data.txt
