#ifndef SCKQMLIF_H
#define SCKQMLIF_H

#include <QObject>
#include <QString>
#include "socketioclient.h"

class SckQmlIF : public QObject
{
    Q_OBJECT

public:
    static SckQmlIF &getInstance();
    Q_INVOKABLE bool connectToSocketServer(QString url, QString token);
    Q_INVOKABLE bool subcribeChannel(QString channel);
    Q_INVOKABLE bool emitToChannel(QString channel, QString data);

private:
    SckQmlIF(QObject *parent = nullptr);
    SckQmlIF(const SckQmlIF &) = delete;            // Delete copy constructor
    SckQmlIF &operator=(const SckQmlIF &) = delete; // Delete copy assignment operator

Q_SIGNALS:
    void showLog(QString log);
};

#endif // SCKQMLIF_H
