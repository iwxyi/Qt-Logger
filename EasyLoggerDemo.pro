QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

DEFINES += QT_DEPRECATED_WARNINGS

INCLUDEPATH += \
    tools/easylogger/inc/ \
    tools/easylogger/port/ \
    tools/easylogger/src/ \
    tools/easylogger/plugins/file/ \

HEADERS += \
    tools/easylogger/inc/elog.h \
    tools/easylogger/plugins/file/elog_file.h \
    mainwindow.h \

SOURCES += \
    tools/easylogger/plugins/file/elog_file.c \
    tools/easylogger/src/elog.c \
    tools/easylogger/src/elog_async.c \
    tools/easylogger/src/elog_buf.c \
    tools/easylogger/src/elog_utils.c \
    main.cpp \
    mainwindow.cpp \

contains(DEFINES,WIN32){
INCLUDEPATH += \
    os/windows/easylogger/inc/

HEADERS += \
    os/windows/easylogger/inc/elog_cfg.h \
    os/windows/easylogger/inc/elog_file_cfg.h

SOURCES += \
    os/windows/easylogger/port/elog_file_port.c \
    os/windows/easylogger/port/elog_port.c
}else{
INCLUDEPATH += \
    os/linux/easylogger/inc/

HEADERS += \
    os/linux/easylogger/inc/elog_cfg.h \
    os/linux/easylogger/inc/elog_file_cfg.h \

SOURCES += \
    os/linux/easylogger/port/elog_file_port.c \
    os/linux/easylogger/port/elog_port.c \
}

FORMS += \
    mainwindow.ui

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
