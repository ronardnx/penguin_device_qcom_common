# Configure audio HAL features
ifeq ($(AUDIO_FEATURE_ENABLED_CIRRUS_CALIBRATION_RESISTANCE),true)
    $(call soong_config_set,qtiaudio,cirrus_calibration_resistance,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_AGM_HIDL),true)
    $(call soong_config_set,qtiaudio,feature_agm_hidl,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLE_BT_A2DP_LPI),true)
    $(call soong_config_set,qtiaudio,feature_bt_a2dp_lpi,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_DEVICE_PREPARE_SEQ),true)
    $(call soong_config_set,qtiaudio,feature_device_prepare_seq,true)
endif

ifeq ($(AUDIO_FEATURE_DISABLED_DTS_EAGLE),true)
    $(call soong_config_set,qtiaudio,feature_disabled_dts_eagle,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_DYNAMIC_SR),true)
    $(call soong_config_set,qtiaudio,feature_dynamic_sr,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_EC_REF_CAPTURE),true)
    $(call soong_config_set,qtiaudio,feature_ec_ref_capture,true)
endif

ifeq ($(AUDIO_FEATURE_ELLIPTIC_ULTRASOUND_SUPPORT),true)
    $(call soong_config_set,qtiaudio,feature_elliptic_ultrasound,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER),true)
    $(call soong_config_set,qtiaudio,feature_ext_amplifier,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT),true)
    $(call soong_config_set,qtiaudio,feature_extended_compress_format,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_GEF_SUPPORT),true)
    $(call soong_config_set,qtiaudio,feature_gef_support,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_GKI),true)
    $(call soong_config_set,qtiaudio,feature_gki,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_HAL_V7), true)
    $(call soong_config_set,qtiaudio,feature_hal_v7,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_INSTANCE_ID),true)
    $(call soong_config_set,qtiaudio,feature_instance_id,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_KEEP_ALIVE),true)
    $(call soong_config_set,qtiaudio,feature_keep_alive,true)
endif

ifeq ($(SOUND_TRIGGER_FEATURE_LPMA_ENABLED),true)
    $(call soong_config_set,qtiaudio,feature_lpma,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_LSM_HIDL),true)
    $(call soong_config_set,qtiaudio,feature_lsm_hidl,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_MCS),true)
    $(call soong_config_set,qtiaudio,feature_mcs,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_PAL_HIDL),true)
    $(call soong_config_set,qtiaudio,feature_pal_hidl,true)
endif

ifeq ($(BOARD_SUPPORTS_QSTHW_API),true)
    $(call soong_config_set,qtiaudio,feature_qsthw_api,true)
endif

ifeq ($(BOARD_SUPPORTS_SOUND_TRIGGER),true)
    $(call soong_config_set,qtiaudio,feature_sound_trigger,true)
endif

ifeq ($(BOARD_SUPPORTS_SOUND_TRIGGER_HAL),true)
    $(call soong_config_set,qtiaudio,feature_sound_trigger,true)
endif

ifeq ($(BOARD_SUPPORTS_SOUND_TRIGGER_CPU_AFFINITY_SET),true)
    $(call soong_config_set,qtiaudio,feature_sound_trigger_cpu_affinity_set,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_SVA_MULTI_STAGE),true)
    $(call soong_config_set,qtiaudio,feature_sva_multi_stage,true)
endif

ifeq ($(AUDIO_FEATURE_ENABLED_TRUE_STEREO),true)
    $(call soong_config_set,qtiaudio,feature_true_stereo,true)
endif

ifneq ($(TARGET_PAL_SPKR_PROTECTION_PATH),)
    $(call soong_config_set,qtiaudio,pal_spkr_protection_path,$(TARGET_PAL_SPKR_PROTECTION_PATH))
endif

ifeq ($(AUDIO_FEATURE_ENABLED_ULTRASOUND_PROXIMITY),true)
    $(call soong_config_set,qtiaudio,ultrasound_proximity,true)
endif

# Select AR variant of A-HAL dependencies
TARGET_USES_QCOM_AUDIO_AR ?= true

QCOM_SOONG_NAMESPACE := device/qcom/common
PRODUCT_SOONG_NAMESPACES += $(QCOM_SOONG_NAMESPACE)

# Add sound trigger HAL to PRODUCT_SOONG_NAMESPACES if needed
ifeq ($(BOARD_SUPPORTS_OPENSOURCE_STHAL),true)
     PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/audio-hal/st-hal-ar
     $(call soong_config_set,qtiaudio,headers_namespace,$(QCOM_SOONG_NAMESPACE))
     $(call soong_config_set,qtiaudio,libarpal_namespace,$(QCOM_SOONG_NAMESPACE))
endif
