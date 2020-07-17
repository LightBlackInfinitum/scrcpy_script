@echo off
echo "STARTING ANDROID DESKTOP (SCRIPT MADE BY LIGHT BLACK INFINITUM) CHECK OUR GROUP: https://t.me/AndroidDesktop"
cd "c:\adb\"
adb kill-server
adb start-server
adb -s DEVICE_ID tcpip 5555
adb devices
adb connect DEVICE_IP:5555
echo "=================================STARTING DESKTOP MODE======================================"
adb -s DEVICE_IP:5555 shell settings put system accelerometer_rotation 0 
adb -s DEVICE_IP:5555 shell settings put system user_rotation 3
echo "=================================LOADING DESKTOP SCREEN MODE================================"
adb -s DEVICE_IP:5555 shell cmd package set-home-activity com.farmerbb.taskbar/.activity.HomeActivity
echo "=================================CONVERTING TO DESKTOP STYLE================================"
adb -s DEVICE_IP:5555 shell wm density 215
echo "=================================DELETING ON SCREEN KEYBOARD================================"
adb -s DEVICE_IP:5555 shell ime set com.wparam.nullkeyboard/.NullKeyboard
echo "=================================INICIATING DESKTOP MODE AND GOING TO HOME SCREEN==========="
adb -s DEVICE_IP:5555 shell settings put system screen_off_timeout 2147483647
adb -s DEVICE_IP:5555 shell input keyevent 3
adb -s DEVICE_IP:5555 shell input keyevent 3


scrcpy -s DEVICE_IP:5555 --render-driver=opengl --rotation 0 -m1280 -b4M -f -w --window-title 'INFINITUM-DESKTOP'


echo "=================================EXITING DESKTOP MODE======================================="
echo "=================================RESTORING ON SCREEN KEYBOARD==============================="
adb -s DEVICE_IP:5555 shell ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
echo "=================================LOADING PHONE MOBILE SCREEN==============================="
adb -s DEVICE_IP:5555 shell cmd package set-home-activity bitpit.launcher/.ui.HomeActivity
adb -s DEVICE_IP:5555 shell settings put system accelerometer_rotation 1
adb -s DEVICE_IP:5555 shell settings put system user_rotation 1
echo "=================================CONVERTING TO PHONE STYLE================================="
adb -s DEVICE_IP:5555 shell wm density 360
echo "=================================GOING TO HOME SCREEN======================================"
adb -s DEVICE_IP:5555 shell settings put system screen_off_timeout 60000
adb -s DEVICE_IP:5555 shell input keyevent 3
adb -s DEVICE_IP:5555 shell input keyevent 3
echo "QUIT SUCESS, PRESS ANY KEY TO CLOSE THIS WINDOW. REMEMBER VISIT US: https://t.me/AndroidDesktop"
pause
