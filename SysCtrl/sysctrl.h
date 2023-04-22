#ifndef SYSCTRL_H
#define SYSCTRL_H

#include <QObject>
#include <QString>
#include <QProcess>

class SysCtrl : public QObject
{
Q_OBJECT
public:
    static SysCtrl& getInstance() {
        static SysCtrl instance;
        return instance;
    }

    Q_INVOKABLE void startStreamRTSP(QString url);
    Q_INVOKABLE void endStreamRTSP();

private:
    SysCtrl(QObject *parent = nullptr); // Private constructor
public:
    SysCtrl(SysCtrl const&) = delete; // Delete copy constructor
    void operator=(SysCtrl const&) = delete; // Delete assignment operator

Q_SIGNALS:

public Q_SLOTS:
};

#endif // SYSCTRL_H
