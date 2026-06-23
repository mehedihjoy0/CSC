LOG_BEGIN "- Adding Google Hotword Enrollment blobs from a73xq"
REMOVE "product" "priv-app/HotwordEnrollment*"
ADD_FROM_FW "a73xq" "product" "priv-app/HotwordEnrollmentOKGoogleEx3HEXAGON"
ADD_FROM_FW "a73xq" "product" "priv-app/HotwordEnrollmentXGoogleEx3HEXAGON"
LOG_END

LOG_BEGIN "- Adding light blobs from source"
ADD_FROM_FW "main" "vendor" "bin/hw/vendor.samsung.hardware.light-service"
ADD_CONTEXT "vendor" "bin/hw/vendor.samsung.hardware.light-service" "hal_light_default_exec"
ADD_FROM_FW "main" "vendor" "lib64/vendor.samsung.hardware.light-V1-ndk_platform.so"
LOG_END

LOG_BEGIN "- Adding wpa_supplicant from a73xqxx"
ADD_FROM_FW "a73xq" "vendor" "bin/hw/wpa_supplicant"
LOG_END

LOG_BEGIN "- Adding SoundBooster libs from stock"
REMOVE "system" "lib/lib_SAG_EQ_ver*.so"
REMOVE "system" "lib64/lib_SAG_EQ_ver*.so"

REMOVE "system" "lib/lib_SoundBooster_ver*.so"
ADD_FROM_FW "stock" "system" "lib/lib_SoundBooster_ver1050.so"
REMOVE "system" "lib64/lib_SoundBooster_ver*.so"
ADD_FROM_FW "stock" "system" "lib64/lib_SoundBooster_ver1050.so"

REMOVE "system" "lib/lib_SoundAlive_play_plus_ver*.so"
ADD_FROM_FW "stock" "system" "lib/lib_SoundAlive_play_plus_ver500.so"
REMOVE "system" "lib64/lib_SoundAlive_play_plus_ver*.so"
ADD_FROM_FW "stock" "system" "lib64/lib_SoundAlive_play_plus_ver500.so"

ADD_FROM_FW "stock" "system" "lib/libaudiosaplus_sec_legacy.so"
ADD_FROM_FW "stock" "system" "lib64/libaudiosaplus_sec_legacy.so"
ADD_FROM_FW "stock" "system" "lib/libsamsungSoundbooster_plus_legacy.so"
ADD_FROM_FW "stock" "system" "lib64/libsamsungSoundbooster_plus_legacy.so"
LOG_END

LOG_BEGIN "- Replacing radio HAL version with 1.5"
sed -i "s/1.4::IRadio/1.5::IRadio/g" "$WORKSPACE/vendor/etc/vintf/manifest.xml"
LOG_END