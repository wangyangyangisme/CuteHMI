include(../common.pri)

TEMPLATE = lib
TARGET = cutehmi_stupid_1
# Instead of using $$qtLibraryTarget, for consistent naming of plugins on all platforms add "d" suffix to debug build.
CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}
DESTDIR = $$DESTDIR/plugins

QT -= gui
QT += qml sql

CONFIG += plugin

include(../cutehmi_utils_1_lib/import.pri)
include(../cutehmi_1/import.pri)
include(../cutehmi_services_1_lib/import.pri)
include(../cutehmi_charts_1_lib/import.pri)
include(../cutehmi_stupid_1_lib/import.pri)

SOURCES += \
    src/stupid/plugin/Plugin.cpp \
    src/stupid/plugin/StupidNodeData.cpp \
    src/stupid/plugin/PluginNodeData.cpp \
    src/stupid/plugin/macros.cpp

HEADERS += \
    src/stupid/plugin/Plugin.hpp \
    src/stupid/plugin/StupidNodeData.hpp \
    src/stupid/plugin/PluginNodeData.hpp \
    src/stupid/plugin/macros.hpp

DISTFILES += cutehmi_stupid_1.json \
    dev/cutehmi_stupid_1-1.solved.Qt.design.txt

RESOURCES += \
    cutehmi_stupid_1.qrc
