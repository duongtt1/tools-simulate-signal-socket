#include "sysctrl.h"
#include <QDebug>
#include <QCoreApplication>
#include <QStringList>

SysCtrl::SysCtrl(QObject *parent) : QObject(parent)
{

}

void SysCtrl::startStreamRTSP(QString url){
    QProcess *process = new QProcess();
    QString program = "ffmpeg";
    QStringList arguments = {"-f", "v4l2", "-i", "/dev/video0", "-pix_fmt", "yuv420p", "-preset", "ultrafast", "-b:v", "600k", "-f", "rtsp", url};

    process->start(program, arguments);
}


void SysCtrl::endStreamRTSP(){
    QProcess *pro = new QProcess();
    QString program = "pkill";
    QStringList arguments = {"ffmpeg"};

    pro->start(program, arguments);
    pro->waitForFinished();
}
