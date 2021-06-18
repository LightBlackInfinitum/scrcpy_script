@echo off

REM ADB Patch
cd "c:\adb\"

REM Device Information (optional)
REM adb -s DEVICE_ID shell wm density
REM adb -s DEVICE_ID shell wm size 
REM adb -s DEVICE_ID shell getprop ro.product.model
REM adb -s DEVICE_ID shell getprop ro.build.version.release
REM adb -s DEVICE_ID shell getprop ro.product.board
REM adb -s DEVICE_ID shell dumpsys battery

REM Screen
adb -s DEVICE_ID shell wm size 1920x1080
adb -s DEVICE_ID shell wm density 215
adb -s DEVICE_ID shell settings put system font_scale  1.20

REM Launcher
adb -s DEVICE_ID shell settings put global policy_control immersive.full=*
adb -s DEVICE_ID shell pm enable com.farmerbb.taskbar
adb -s DEVICE_ID shell pm disable-user bitpit.launcher
adb -s DEVICE_ID shell cmd package set-home-activity com.farmerbb.taskbar/.activity.HomeActivity
adb -s DEVICE_ID shell am start -W -c android.intent.category.HOME -a android.intent.action.MAIN

REM Rotation
adb -s DEVICE_ID shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:0

REM Keyboard
adb -s DEVICE_ID shell ime set com.wparam.nullkeyboard/.NullKeyboard

REM Stuff
adb -s DEVICE_ID shell cmd vibrator vibrate 100
adb -s DEVICE_ID shell cmd vibrator vibrate 100
adb -s DEVICE_ID shell cmd vibrator vibrate 100
adb -s DEVICE_ID shell cmd vibrator vibrate 100
timeout /t 1 /nobreak >nul

REM Scrcpy
scrcpy -s DEVICE_ID --render-driver=direct3d --rotation 0 -m1366 -b60M --max-fps 30 -f -Sw --disable-screensaver --window-title 'ANDROID-DESKTOP'


REM Screen
adb -s DEVICE_ID shell wm size reset
adb -s DEVICE_ID shell wm density reset
adb -s DEVICE_ID shell settings put system font_scale  1.0
timeout /t 1 /nobreak >nul

REM Rotation
adb -s DEVICE_ID shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:1

REM Keyboard
adb -s DEVICE_ID shell ime set com.google.android.inputmethod.latin/com.android.inputmethod.latin.LatinIME

REM Launcher
adb -s DEVICE_ID shell settings put global policy_control null*
adb -s DEVICE_ID shell pm enable bitpit.launcher
adb -s DEVICE_ID shell pm disable-user com.farmerbb.taskbar
adb -s DEVICE_ID shell cmd package set-home-activity bitpit.launcher/.ui.HomeActivity
adb -s DEVICE_ID shell am start -W -c android.intent.category.HOME -a android.intent.action.MAIN

REM Stuff
adb -s DEVICE_ID shell cmd vibrator vibrate 100

echo "REMEMBER VISIT US: https://t.me/joinchat/SLlAIfdCFxLeexVB"
timeout /t 10 /nobreak >nul
