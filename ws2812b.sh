#!/bin/sh

if [  ! -d "/home/pi/ws2812b_auto_update/" ]; then
 mkdir /home/pi/ws2812b_auto_update/
 echo "mkdir ws2812b_auto_update/"
fi

cd /home/pi/ws2812b_auto_update
if [ -d "/home/pi/ws2812b_auto_update/rpi0_ws2812b/" ]; then
 rm -rf rpi0_ws2812b
 echo "rm -rf ws2812b_auto_update/rpi0_ws2812b/"
fi

sleep 10s
timeout 60 git clone https://github.com/GodenX/rpi0_ws2812b.git

if [ -d "/home/pi/rpi0_ws2812b/" ]; then
 cd ./rpi0_ws2812b/
 if [ -f "/home/pi/ws2812b_auto_update/rpi0_ws2812b/update" ]; then
  echo "update..."
  rm update
  rm -rf /home/pi/rpi0_ws2812b/
  cd ..
  mv /home/pi/rpi0_ws2812b /home/pi/
 else
  echo "git pull"
  cd /home/pi/rpi0_ws2812b/
  timeout 60 git checkout -f
  timeout 60 git pull -f
  rm -rf /home/pi/ws2812b_auto_update/rpi0_ws2812b/
 fi
else
 mv /home/pi/ws2812b_auto_update/rpi0_ws2812b/ /home/pi/
 cd /home/pi/rpi0_ws2812b/
 if [ -f "/home/pi/rpi0_ws2812b/update" ]; then
  rm update
 fi
fi

nohup python3 /home/pi/rpi0_ws2812b/app.py >> /home/pi/ws2812b.out 2>&1 &
echo "OK!"

exit 0
