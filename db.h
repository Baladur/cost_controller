#ifndef DB_H
#define DB_H
#pragma once
#include <QObject>
#include <sqlite3.h>
#include <string>
#include <iostream>
#include <QDebug>
#include "manager.h"
#include "note.h"
using namespace std;
class db : public QObject
{
    Q_OBJECT
    sqlite3 *sqldb;
    Manager *m_owner;
    static int callback(void * notused,int coln,char **rows,char **colnm);

public:
    class DBException
    {
    public:
        char* message;
        DBException(const char * _error):message(strcpy(message,_error)) {}
    };

    static sqlite3_stmt stmt;
    db(Manager *owner=0);
    ~db();
    Q_INVOKABLE void create();
    Q_INVOKABLE Manager *getOwner() { return m_owner; }
    Q_INVOKABLE void destroy();
    Q_INVOKABLE void read();
    Q_INVOKABLE void insert(Note *_note);
signals:
    Q_INVOKABLE void dataLoaded();
//public slots:
    // void insert(Note *_note);

   // string read(const string &_key,const string &_conditionKey,const string &_conditionValue);
};

#endif // DB_H
