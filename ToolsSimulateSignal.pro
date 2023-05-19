QT += quick
CONFIG += c++14
CONFIG += no_keywords

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += SIO_TLS


# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
    SocketIO/src/RoomControl.cpp \
    SocketIO/src/SckQmlIF.cpp \
    SocketIO/src/socketioclient.cpp \
    SocketIO/src/SocketMgr.cpp \
    SysCtrl/sysctrl.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../socket.io-client-cpp/release/ -lsioclient
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../socket.io-client-cpp/debug/ -lsioclient
else:unix: LIBS += -L$$PWD/../../socket.io-client-cpp/ -lsioclient

INCLUDEPATH += $$PWD/../../socket.io-client-cpp
DEPENDPATH += $$PWD/../../socket.io-client-cpp

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../socket.io-client-cpp/release/libsioclient.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../socket.io-client-cpp/debug/libsioclient.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../socket.io-client-cpp/release/sioclient.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../socket.io-client-cpp/debug/sioclient.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../socket.io-client-cpp/libsioclient.a

LIBS += -pthread -fopenmp
LIBS += -lssl -lcrypto
LIBS += -lboost_system -lboost_thread -lboost_random -lboost_regex

HEADERS += \
    SocketIO/inc/RoomControl.h \
    SocketIO/inc/SckQmlIF.h \
    SocketIO/inc/socketioclient.h \
    SocketIO/inc/SocketMgr.h \
    SysCtrl/sysctrl.h
