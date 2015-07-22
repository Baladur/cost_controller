#ifndef DROPDOWNLIST_H
#define DROPDOWNLIST_H

#include <QObject>
#include <QListView>

class DropDownList: public QObject
{
    Q_OBJECT
public:

    DropDownList();
    ~DropDownList();
};

#endif // DROPDOWNLIST_H
