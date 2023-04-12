#include "../inc/SckQmlIF.h"
#include <map>
#include <QDebug>
#include <thread>

SckQmlIF& SckQmlIF::getInstance() {
    static SckQmlIF instance; // Singleton instance
    return instance;
}

SckQmlIF::SckQmlIF(QObject* parent) : QObject(parent) {
    // Private constructor to prevent instantiation
    // Only accessible from within the class
}

bool SckQmlIF::connectToSocketServer(QString url, QString token){
    std::string tk = token.toStdString();
    std::map<std::string, std::string> query;
    query.insert(std::pair<std::string, std::string>("token", tk));
    qDebug() << "1";
    SocketIoClient::getInstance().connectToServer(url.toStdString(), query);
    std::this_thread::sleep_for(std::chrono::milliseconds(1500));
    qDebug() << "2";
    QString log = "connected to " + url + "successfuly";
    qDebug() << log;
    Q_EMIT showLog(log);
    return true;
}

bool SckQmlIF::subcribeChannel(QString channel){
    SocketIoClient::getInstance().listenForEvent(channel.toStdString(), [&](sio::event& event){
        std::string msg_std = event.get_message()->get_string();
        QString msg = QString::fromUtf8(msg_std.c_str());
        QString log = "Topic " + channel + " data: " +  msg;
        Q_EMIT showLog(log);
    });
    QString msg_log = "subcribed channel " + channel;
    Q_EMIT showLog(msg_log);
    return true;
}

bool SckQmlIF::emitToChannel(QString channel, QString data){
    sio::message::list msglist;
    msglist.push(sio::string_message::create(data.toStdString()));
    SocketIoClient::getInstance().emitEvent(channel.toStdString(), msglist);
    QString log = "Emit " + channel + " data: " +  data;
    Q_EMIT showLog(log);
    return true;
}

