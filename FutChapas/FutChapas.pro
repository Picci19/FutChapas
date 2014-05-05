# Add more folders to ship with the application, here
folder_01.source = qml/FutChapas
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp

# Installation path
# target.path =

# Please do not modify the following two lines. Required for deployment.
include(qtquick2applicationviewer/qtquick2applicationviewer.pri)
qtcAddDeployment()

OTHER_FILES += \
    qml/FutChapas/content/arco.png \
    qml/FutChapas/content/btn_jugar.png \
    qml/FutChapas/content/chapa_barcelona.png \
    qml/FutChapas/content/chapa_madrid.png \
    qml/FutChapas/content/HomeScreen.png \
    qml/FutChapas/content/sound_gol.wav \
    qml/FutChapas/content/sound_home.png \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
