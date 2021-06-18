@echo off

REM ADB Patch
cd "c:\adb\"

REM ADB Connecting
adb kill-server
adb start-server
adb -s DEVICE_ID tcpip 5555
adb connect DEVICE_IP:5555

REM Device Information (optional)
REM adb -s DEVICE_IP:5555 shell wm density
REM adb -s DEVICE_IP:5555 shell wm size 
REM adb -s DEVICE_IP:5555 shell getprop ro.product.model
REM adb -s DEVICE_IP:5555 shell getprop ro.build.version.release
REM adb -s DEVICE_IP:5555 shell getprop ro.product.board
REM adb -s DEVICE_IP:5555 shell dumpsys battery

REM Screen
adb -s DEVICE_IP:5555 shell settings put system screen_off_timeout 2147483647
adb -s DEVICE_IP:5555 shell wm size 1920x1080
adb -s DEVICE_IP:5555 shell wm density 215
adb -s DEVICE_IP:5555 shell settings put system font_scale  1.20

REM Launcher
adb -s DEVICE_IP:5555 shell settings put global policy_control immersive.full=*
adb -s DEVICE_IP:5555 shell pm enable com.farmerbb.taskbar
adb -s DEVICE_IP:5555 shell pm disable-user bitpit.launcher
adb -s DEVICE_IP:5555 shell cmd package set-home-activity com.farmerbb.taskbar/.activity.HomeActivity
adb -s DEVICE_IP:5555 shell am start -W -c android.intent.category.HOME -a android.intent.action.MAIN

REM Rotation
adb -s DEVICE_IP:5555 shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0

REM Keyboard
adb -s DEVICE_IP:5555 shell ime set com.wparam.nullkeyboard/.NullKeyboard

REM Stuff
adb -s DEVICE_IP:5555 shell cmd vibrator vibrate 100
adb -s DEVICE_IP:5555 shell cmd vibrator vibrate 100
adb -s DEVICE_IP:5555 shell cmd vibrator vibrate 100
adb -s DEVICE_IP:5555 shell cmd vibrator vibrate 100
timeout /t 1 /nobreak >nul


REM Scrcpy
scrcpy -s DEVICE_IP:5555 --render-driver=direct3d --rotation 0 -m1366 -b6M --max-fps 30 -f -Sw --disable-screensaver --window-title 'ANDROID-DESKTOP'


REM Screen
adb -s DEVICE_IP:5555 shell settings put system screen_off_timeout 60000
adb -s DEVICE_IP:5555 shell wm size reset
adb -s DEVICE_IP:5555 shell wm density reset
adb -s DEVICE_IP:5555 shell settings put system font_scale  1.0
timeout /t 1 /nobreak >nul

REM Rotation
adb -s DEVICE_IP:5555 shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:1

REM Keyboard
adb -s DEVICE_IP:5555 shell ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME

REM Launcher
adb -s DEVICE_IP:5555 shell settings put global policy_control null*
adb -s DEVICE_IP:5555 shell pm enable bitpit.launcher
adb -s DEVICE_IP:5555 shell pm disable-user com.farmerbb.taskbar
adb -s DEVICE_IP:5555 shell cmd package set-home-activity bitpit.launcher/.ui.HomeActivity
adb -s DEVICE_IP:5555 shell am start -W -c android.intent.category.HOME -a android.intent.action.MAIN

REM Stuff
adb -s DEVICE_IP:5555 shell cmd vibrator vibrate 100

echo "REMEMBER VISIT US: https://t.me/joinchat/SLlAIfdCFxLeexVB"
pause
timeout /t 10 /nobreak >nul
