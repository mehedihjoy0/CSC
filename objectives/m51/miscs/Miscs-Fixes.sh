LOG_BEGIN "- Increasing speaker volume values to 90"
sed -i -E '/WSA_RX[01] Digital Volume/s/value="[^"]*"/value="90"/' \
"$WORKSPACE"/vendor/etc/mixer_paths*.xml
LOG_END