@echo off

REM ADB Patch
cd "c:\adb\"

REM ADB Connecting
adb kill-server
adb start-server
adb -s DEVICE_ID tcpip 5555
adb connect DEVICE_IP:5555

REM Device Information (optional)
adb -s DEVICE_IP:5555 shell wm density
adb -s DEVICE_IP:5555 shell wm size 
adb -s DEVICE_IP:5555 shell getprop ro.product.model
adb -s DEVICE_IP:5555 shell getprop ro.build.version.release
adb -s DEVICE_IP:5555 shell getprop ro.product.board
adb -s DEVICE_IP:5555 shell dumpsys battery

REM Screen
adb -s DEVICE_IP:5555 shell settings put system screen_off_timeout 2147483647

REM Keyboard
adb -s DEVICE_IP:5555 shell ime set com.wparam.nullkeyboard/.NullKeyboard


REM Scrcpy
scrcpy -s DEVICE_IP:5555 --render-driver=direct3d -m1366 -b6M --max-fps 30 -f -w --disable-screensaver --window-title 'ANDROID-DESKTOP'


REM Keyboard
adb -s DEVICE_IP:5555 shell ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME

REM Screen
adb -s DEVICE_IP:5555 shell settings put system screen_off_timeout 60000

echo "REMEMBER VISIT US: https://t.me/joinchat/SLlAIfdCFxLeexVB"
pause