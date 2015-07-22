#ifndef NOTE_H
#define NOTE_H

#include <QObject>
#include <QString>

class Note : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int id READ getId WRITE setId NOTIFY idChanged)
    Q_PROPERTY(int day READ getDay WRITE setDay NOTIFY dayChanged)
    Q_PROPERTY(float sum READ getSum WRITE setSum NOTIFY sumChanged)
    Q_PROPERTY(QString com READ getCom WRITE setCom NOTIFY comChanged)
public:
    Note();
    Note(const Note &);
    Note &operator=(const Note &);
    //setters:
    void setId(const int &_id) { id=_id; }
    void setDay(const int &_day) { day=_day;}
    void setSum(const float &_sum) { sum=_sum;}
    void setCom(const QString &_com) { com=_com;}
    //getters:
   Q_INVOKABLE int getId() { return id; }
   Q_INVOKABLE int getDay() { return day;}
   Q_INVOKABLE float getSum() { return sum;}
   Q_INVOKABLE QString getCom() { return com;}
signals:
    void idChanged();
    void dayChanged();
    void sumChanged();
    void comChanged();
private:
    int id;
    int day;
    float sum;
    QString com;
};

#endif // NOTE_H
