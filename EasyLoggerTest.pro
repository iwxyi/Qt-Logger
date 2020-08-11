QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
message(defines: $$DEFINES)
# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

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

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
