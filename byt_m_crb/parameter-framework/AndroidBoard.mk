include $(PLATFORM_PATH)/parameter-framework/AndroidBoard.mk

LOCAL_PATH := $(DEVICE_PATH)/parameter-framework

##################################################

include $(CLEAR_VARS)
LOCAL_MODULE := parameter-framework.audio.byt_m_crb
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES :=  \
	parameter-framework.audio.baytrail \
	AudioClass.xml \
	AudioConfigurableDomains.xml \
	ParameterFrameworkConfiguration.xml
include $(BUILD_PHONY_PACKAGE)


##################################################


include $(CLEAR_VARS)
LOCAL_MODULE := AudioClass.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/parameter-framework/Structure/Audio
LOCAL_SRC_FILES := XML/Structure/Audio/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)


ifeq ($(BOARD_USES_AUDIO_HAL_CONFIGURABLE),true)

## Audio Tuning + Routing

include $(CLEAR_VARS)
LOCAL_MODULE := AudioConfigurableDomains.xml
LOCAL_SRC_FILES := XML/Settings/Audio/AudioRoutingConfigurableDomains.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/parameter-framework/Settings/Audio
include $(BUILD_PREBUILT)

else

## Audio Tuning only

include $(CLEAR_VARS)
LOCAL_MODULE := AudioConfigurableDomains.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/parameter-framework/Settings/Audio
LOCAL_SRC_FILES := XML/Settings/Audio/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

endif

##################################################

ifeq ($(TARGET_BUILD_VARIANT),eng)

### Engineering build: Tuning allowed

# baylake
include $(CLEAR_VARS)
LOCAL_MODULE := ParameterFrameworkConfiguration.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/parameter-framework
LOCAL_SRC_FILES := XML/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

else

### Userdebug build: NoTuning allowed


# baytrail
include $(CLEAR_VARS)
LOCAL_MODULE := ParameterFrameworkConfiguration.xml
LOCAL_SRC_FILES := XML/ParameterFrameworkConfigurationNoTuning.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/parameter-framework
include $(BUILD_PREBUILT)

endif

