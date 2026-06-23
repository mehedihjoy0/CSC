LOG_BEGIN "- Adding Polarr libs from a73xq"
ADD_FROM_FW "a73xq" "system" "etc/public.libraries-polarr.txt"
ADD_FROM_FW "a73xq" "system" "lib64/libBestComposition.polarr.so"
ADD_FROM_FW "a73xq" "system" "lib64/libFeature.polarr.so"
ADD_FROM_FW "a73xq" "system" "lib64/libPolarrSnap.polarr.so"
ADD_FROM_FW "a73xq" "system" "lib64/libTracking.polarr.so"
ADD_FROM_FW "a73xq" "system" "lib64/libYuv.polarr.so"
LOG_END

LOG_BEGIN "- Adding camera libs from stock"
ADD_FROM_FW "stock" "system" "lib64/liblow_light_hdr.arcsoft.so"
ADD_FROM_FW "stock" "system" "lib64/libhigh_dynamic_range.arcsoft.so"
ADD_FROM_FW "stock" "system" "lib64/libhumantracking.arcsoft.so"
ADD_FROM_FW "stock" "system" "lib64/libhumantracking_util.camera.samsung.so"
ADD_FROM_FW "stock" "system" "lib64/libveengine.arcsoft.so"
LOG_END

LOG_BEGIN "- Adding secimaging_pdk lib from a73xq"
ADD_FROM_FW "a73xq" "system" "lib64/libsecimaging_pdk.camera.samsung.so"
LOG_END

LOG_BEGIN "- Replacing MIDAS blobs with source"
REMOVE "vendor" "etc/midas"
ADD_FROM_FW "main" "vendor" "etc/midas"
sed -i "s|a73xq|$DEVICE_CODENAME|g" "$WORKSPACE/vendor/etc/midas/midas_config.json"
LOG_END

LOG_BEGIN "- Replacing singletake config files with source"
REMOVE "vendor" "etc/singletake"
ADD_FROM_FW "main" "vendor" "etc/singletake"
LOG_END