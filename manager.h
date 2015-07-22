#ifndef MANAGER_H
#define MANAGER_H

#include <QObject>
//#include "db.h"
#include "note.h"
#include <QVector>
class db;
class Manager : public QObject
{
    Q_OBJECT

public:
    Manager();
    //explicit Manager(QObject *parent=0);
    ~Manager();
    void setLastSavedId(int _lsid) { lastSavedId=_lsid; }
    Q_INVOKABLE Note* getNote(int d,int a);
    Q_INVOKABLE Note* getLast(int d);
    Q_INVOKABLE int getSize(int d);
    Q_INVOKABLE inline int getLastId() { return lastId; }
    Q_INVOKABLE inline int getLastSavedId() { return lastSavedId; }
    Q_INVOKABLE void addNote(int _d,float _sum,QString _com);
    Q_INVOKABLE int getToday();
    Q_INVOKABLE void saveData();
signals:
    void sendNote(Note *_note);
    void notesChanged();
    void setView();
private:
    QVector<Note *> notes[7];
    db *m_db;
    int lastId;
    int lastSavedId;

};

#endif // MANAGER_H
