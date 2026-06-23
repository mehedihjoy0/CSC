LOG_BEGIN "- Removing WAV 32-bit PCM support"
BPROP "system" "media.extractor.sec.pcm-32bit" ""
LOG_END

LOG_BEGIN "- Disabling HeatMapThread logspam"
BPROP "system" "media.extractor.sec.pcm-32bit" "S"
LOG_END

LOG_BEGIN "- Fixing edge lighting"
BPROP "system" "ro.factory.model" "$(GET_PROP "vendor" "ro.product.vendor.model" "stock")"
LOG_END

LOG_BEGIN "- Increasing audio offload buffer size"
BPROP "vendor" "vendor.audio.offload.buffer.size.kb" "256"
LOG_END

LOG_BEGIN "- Decreasing touch latency"
BPROP "vendor" "ro.surface_flinger.use_content_detection_for_refresh_rate" "true"
LOG "- Adding "ro.surface_flinger.set_idle_timer_ms" prop with "4000" in /vendor/default.prop"
sed -i "/use_content_detection/a ro.surface_flinger.set_idle_timer_ms=4000" "$WORKSPACE/vendor/default.prop"
LOG "- Adding "ro.surface_flinger.set_touch_timer_ms" prop with "4000" in /vendor/default.prop"
sed -i "/set_idle_timer_ms/a ro.surface_flinger.set_touch_timer_ms=4000" "$WORKSPACE/vendor/default.prop"
BPROP "vendor" "ro.surface_flinger.enable_frame_rate_override" "true"
LOG_END