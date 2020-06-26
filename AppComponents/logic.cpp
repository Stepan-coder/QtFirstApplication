#include "logic.h"
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <QDebug>
#include <time.h>
#include "windows.h"
#include <QTime>
#include <QCoreApplication>
using namespace std;

void delay( int millisecondsToWait )
{
    QTime dieTime = QTime::currentTime().addMSecs( millisecondsToWait );
    while( QTime::currentTime() < dieTime )
    {
        QCoreApplication::processEvents( QEventLoop::AllEvents, 100 );
    }
}

Logic::Logic(QObject *parent) : QObject(parent)
{
    srand(time(NULL));
}

void Logic::master( const int &type, const int &nums, const int &time, const int &count)
{
    setIsMathProcessing(true);
    setTaskString("");
    int thisAnswer = 0;
    for (int c = 0; c < 5 + 5*count; c++)
    {
        int newVal = randGenerator(nums);
        setTaskString(QString::number(newVal));
        switch (type)
        {
            case 0:
                thisAnswer += newVal;
                break;
            case 1:
                thisAnswer -= newVal;
                break;
            case 2:
                thisAnswer *= newVal;
                break;
        }

        switch (time)
        {
            case 0:
                delay(10000);
                break;
            case 1:
                delay(5000);
                break;
            case 2:
                delay(3000);
                break;
            case 3:
                delay(1000);
                break;
            case 4:
                delay(500);
                break;
        }
    }
    qDebug() << thisAnswer;
    setTaskString("");
    setIsMathProcessing(false);
    setAnswer(QString::number(thisAnswer));
}


int Logic::randGenerator(const int count)
{
    int min = pow(10, count);
    int max = pow(10, count + 1);
    return min + rand() % ((max + 1) - min);
}

bool Logic::isMathProcessing()
{
    return b_isMathProcessing;
}

void Logic::setIsMathProcessing(bool value)
{
    if(b_isMathProcessing==value)
            return;
        b_isMathProcessing = value;
        emit mathProcessingChanged(value);
}

QString Logic::taskString()
{
    return s_taskString;
}

void Logic::setTaskString(const QString &value)
{
    if (value == s_taskString)
            return;
    s_taskString = value;
    emit taskStringChanged();
}

QString Logic::answer()
{
    return s_answer;
}

void Logic::setAnswer(const QString &value)
{
    if (value == s_answer)
            return;
    s_answer = value;
    emit answerChanged();
}



