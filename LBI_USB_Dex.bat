@echo off
echo "STARTING ANDROID DESKTOP (SCRIPT MADE BY LIGHT BLACK INFINITUM) CHECK OUR GROUP: https://t.me/AndroidDesktop"
cd "c:\adb\"
adb devices
echo "=================================STARTING DESKTOP MODE======================================"
adb -s DEVICE_ID shell settings put system accelerometer_rotation 0 
adb -s DEVICE_ID shell settings put system user_rotation 3
echo "=================================LOADING DESKTOP SCREEN MODE================================"
adb -s DEVICE_ID shell cmd package set-home-activity com.farmerbb.taskbar/.activity.HomeActivity
echo "=================================CONVERTING TO DESKTOP STYLE================================"
adb -s DEVICE_ID shell wm density 215
echo "=================================DELETING ON SCREEN KEYBOARD================================"
adb -s DEVICE_ID shell ime set com.wparam.nullkeyboard/.NullKeyboard
echo "=================================INICIATING DESKTOP MODE AND GOING TO HOME SCREEN==========="
adb -s DEVICE_ID shell input keyevent 3


scrcpy -s DEVICE_ID --render-driver=opengl --rotation 0 -m1360 -b10M -f -Sw --window-title 'INFINITUM-DESKTOP'


echo "=================================EXITING DESKTOP MODE======================================="
echo "=================================RESTORING ON SCREEN KEYBOARD==============================="
adb -s DEVICE_ID shell ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME
echo "=================================LOADING PHONE MOBILE SCREEN==============================="
adb -s DEVICE_ID shell cmd package set-home-activity bitpit.launcher/.ui.HomeActivity
adb -s DEVICE_ID shell settings put system accelerometer_rotation 1
adb -s DEVICE_ID shell settings put system user_rotation 1
echo "=================================CONVERTING TO PHONE STYLE================================="
adb -s DEVICE_ID shell wm density 360
echo "=================================GOING TO HOME SCREEN======================================"
adb -s DEVICE_ID shell input keyevent 3
echo "QUIT SUCESS, PRESS ANY KEY TO CLOSE THIS WINDOW. REMEMBER VISIT US: https://t.me/AndroidDesktop"
pause
