#include "manager.h"
#include "db.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QDate>
using namespace std;
Manager::Manager():lastId(0),lastSavedId(0)
{
    try
    {
        m_db=new db(this);
        m_db->create();
        m_db->read();
        //m_db->destroy();
    }
    catch (db::DBException e)
    {
        qDebug()<<e.message;
    }
}


Manager::~Manager()
{
    for (int i=0;i<7;i++)
    for_each(notes[i].begin(),notes[i].end(),[](Note *p){delete p;});
    delete m_db;
}

Note* Manager::getNote(int d,int a)
{

    if (a>=0 && a<notes[d].size() && d>=0 && d<=7)
        return notes[d][a];
    else
    {
        qDebug()<<"NULL returned in getNote";
        return NULL;
    }


}
Note* Manager::getLast(int d)
{
    return notes[d][getSize(d)-1];
}
void Manager::addNote(int _d, float _sum, QString _com)
{
    Note* n=new Note;
    n->setDay(_d);
    n->setSum(_sum);
    n->setCom(_com);
    n->setId(++lastId);
    qDebug()<<"in addNote: lastId:"<<lastId<<" lastSavedId: "<<lastSavedId;
    notes[_d].push_back(n);
}
int Manager::getSize(int d)
{

    return notes[d].size();
}


int Manager::getToday()
{
    QDate qd=QDate::currentDate();
    return qd.dayOfWeek()-1;
}
void Manager::saveData()
{
   // if (lastId!=lastSavedId)
    //{
        for (int i=0;i<7;i++)
            for (int j=0;j<notes[i].size();j++)
            {
                int lid=notes[i][j]->getId();
                if (lid>lastSavedId)
                   m_db->insert(notes[i][j]);
            }
        lastSavedId=lastId;
        qDebug()<<"in saveData():";
        qDebug()<<"lastId: "<<lastId;
        qDebug()<<"lastSavedId: "<<lastSavedId;
   // }

}
