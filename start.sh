#!/bin/bash
export HOME=/root
export USER=root

mkdir -p ~/.vnc
echo "password" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

rm -rf /tmp/.X1-lock /tmp/.X11-unix/X1

vncserver :1 -geometry 1280x720 -depth 24
sleep 3

PORT="${PORT:-8080}"
websockify --web /usr/share/novnc/ --wrap-mode=ignore $PORT localhost:5901
