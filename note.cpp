#include "note.h"

Note::Note():day(1),sum(0.0),com("")
{

}
Note::Note(const Note &n)
{
    day=n.day;
    sum=n.sum;
    com=n.com;
}
Note & Note::operator=(const Note &n)
{
    day=n.day;
    sum=n.sum;
    com=n.com;
    return *this;
}


