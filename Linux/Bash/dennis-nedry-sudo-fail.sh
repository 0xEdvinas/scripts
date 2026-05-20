#!/bin/bash

journalctl -f -n0 _COMM=sudo | while read -r line; do
    echo "$line" | grep -q "authentication failure"

    if [ $? -eq 0 ]; then
	DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$(id -u) \
	mpv --really-quiet --no-loop ~/Videos/ahahah.mp4 >/dev/null 2>&1 &
    fi
done
