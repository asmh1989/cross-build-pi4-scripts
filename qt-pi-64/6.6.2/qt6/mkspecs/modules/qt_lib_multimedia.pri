QT.multimedia.VERSION = 6.6.2
QT.multimedia.name = QtMultimedia
QT.multimedia.module = Qt6Multimedia
QT.multimedia.libs = $$QT_MODULE_LIB_BASE
QT.multimedia.ldflags = 
QT.multimedia.includes = $$QT_MODULE_INCLUDE_BASE $$QT_MODULE_INCLUDE_BASE/QtMultimedia
QT.multimedia.frameworks = 
QT.multimedia.bins = $$QT_MODULE_BIN_BASE
QT.multimedia.plugin_types = multimedia
QT.multimedia.depends =  core gui network
QT.multimedia.uses = 
QT.multimedia.module_config = v2
QT.multimedia.DEFINES = QT_MULTIMEDIA_LIB
QT.multimedia.enabled_features = alsa pulseaudio
QT.multimedia.disabled_features = avfoundation coreaudio videotoolbox evr mmrenderer
QT_CONFIG += alsa pulseaudio
QT_MODULES += multimedia

