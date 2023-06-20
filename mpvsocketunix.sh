echo '{ "command": ["get_property", "playback-time"] }' | socat - /tmp/mpvsocket | python3 -c "import sys, json; print(json.load(sys.stdin)['data'])"
