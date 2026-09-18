#!/bin/bash

export DISPLAY=:0
Xvfb :0 -screen 0 1280x720x24 &
sleep 2

startxfce4 &
sleep 2

x11vnc -display :0 -nopw -forever -bg -shared

PORT="${PORT:-8080}"
websockify --web /usr/share/novnc/ $PORT localhost:5900
