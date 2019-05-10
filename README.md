## rpi0_ws2812b_update_tool
----------------------------------------------------

### Description :
- 将"ws2812b.service"文件放到/usr/lib/systemd/system/文件夹下，如果systemd文件夹下没有system文件则自己创建
- 使用```sudo systemctl enable ws2812b.service```命令，设置开机自动运行服务 
- 将"ws2812b.sh"文件放到/home/pi根目录(~/)下，设置777权限


**Author**         : Jackie Yang  
**Email**          : czyangyinghao@163.com  
**Date**           : 06/05/2019
