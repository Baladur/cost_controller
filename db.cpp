#include "db.h"
//#include "manager.h"

db::db(Manager *owner)
{
    //dbman=NULL;
    m_owner=owner;
    char *err;
    int rc=sqlite3_open("data1.db",&sqldb);
    if (rc!=SQLITE_OK)
    {
        err=(char *)sqlite3_errmsg(sqldb);
        qDebug()<<"Error in opening datase: "<<err;
        throw DBException(err);
        sqlite3_close(sqldb);
    }

}

db::~db()
{
    m_owner=NULL;
    sqlite3_close(sqldb);
}


void db::create()
{
    char *err;
    const char* q = "CREATE TABLE if not exists 'Notes'('ID' INT AUTO_INCREMENT NOT NULL,'Sum' FLOAT NOT NULL,'Description' Char(40) NOT NULL,'Day' INT NOT NULL,PRIMARY KEY('ID'));";
    int rc=sqlite3_exec(sqldb,q,callback,NULL,&err);
    if (rc!=SQLITE_OK)
    {
        qDebug()<<"Error in create function: "<<err;//throw DBException(err);
        sqlite3_close(sqldb);
    }
    else
        qDebug()<<"Yahoooooooooo! Table created!!";
}
void db::insert(Note *_note)
{
    qDebug()<<"insert called";
    char *err;
    QString query="INSERT INTO 'Notes'(ID,Sum,Description,Day)VALUES('"+QString::number(_note->getId())+"','"+QString::number(_note->getSum())+"','"+_note->getCom()+"','"+QString::number(_note->getDay())+"');";
    const char *q=query.toStdString().c_str();
    int rc=sqlite3_exec(sqldb,q,NULL,NULL,&err);
    if (rc!=SQLITE_OK)
    {
        qDebug()<<"Error in insert function: "<<err;
    }
    else
        qDebug()<<"Inserted!";

}
void db::read()
{
    char* err;
    int rc = sqlite3_exec(sqldb,"SELECT * FROM 'Notes';",callback,m_owner,&err);
    if (rc!=SQLITE_OK)
    {
        qDebug()<<"Error in read function: "<<err;
        exit(1);
    }
    else
    {
        m_owner->setLastSavedId(m_owner->getLastId());
        emit m_owner->setView();
        qDebug()<<"in read(): ";
        qDebug()<<"lastId: "<<m_owner->getLastId();
        qDebug()<<"lastSavedId: "<<m_owner->getLastSavedId();
    }
}

void db::destroy()
{
    char *err;
    int rc=sqlite3_exec(sqldb,"DROP TABLE 'Notes';",NULL,NULL,&err);
    if (rc)
        qDebug()<<"Error in destroy function: "<<err;
    else
        qDebug()<<"Table has been destroyed!";
}
int db::callback(void * notused,int coln,char **rows,char **colnm)
{
    /*
     * coln - number of columns
     * rows - array of values in a record
     * colnm - names of columns
     * */
    //qDebug()<<"Names of columns:";
    Manager *lman=reinterpret_cast<Manager *>(notused);
    if (lman==NULL)
    {
        qDebug()<<"Manager is not assigned! Exit...";
        exit(1);
    }
    for (int i=0;i<coln;i++)
        qDebug()<<colnm[i];
    lman->addNote(atoi(rows[3]),QString::fromUtf8(rows[1]).toFloat(),QString::fromUtf8(rows[2]));
        qDebug()<<"id:"<<QString::number(lman->getLast(atoi(rows[3]))->getId())<<"sum:"<<QString::number(lman->getLast(atoi(rows[3]))->getSum())<<"description: "<<lman->getLast(atoi(rows[3]))->getCom()<<"day: "<<QString::number(lman->getLast(atoi(rows[3]))->getDay()+1);
    return 0;
}
