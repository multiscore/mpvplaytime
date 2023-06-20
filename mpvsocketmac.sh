echo '{ "command": ["get_property", "playback-time"] }' | /usr/local/bin/socat - /tmp/mpvsocket | /usr/local/bin/python3 -c "import sys, json; print(json.load(sys.stdin)['data'])"
