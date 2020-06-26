#ifndef LOGIC_H
#define LOGIC_H

#include <QObject>

class Logic : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isMathProcessing READ isMathProcessing WRITE setIsMathProcessing NOTIFY mathProcessingChanged)
    Q_PROPERTY(QString taskString READ taskString WRITE setTaskString NOTIFY taskStringChanged)
     Q_PROPERTY(QString answer READ answer WRITE setAnswer NOTIFY answerChanged)
public:
    explicit Logic(QObject *parent = nullptr);

    Q_INVOKABLE void master(const int &type, const int &nums, const int &time, const int &count);
    int randGenerator(const int count);
    bool isMathProcessing();
    void setIsMathProcessing(bool value);
    QString taskString();
    void setTaskString(const QString &value);
    QString answer();
    void setAnswer(const QString &value);

signals:
    void mathProcessingChanged(bool value);
    void taskStringChanged();
    void answerChanged();

private:
    bool b_isMathProcessing;
    QString s_answer;
    QString s_taskString;
};

#endif // LOGIC_H
