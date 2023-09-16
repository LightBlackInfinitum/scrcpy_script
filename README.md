## Scrcpy Batch Script:
The following script automates the scrcpy connection with your phone and simulates a desktop environment using Taskbar Launcher. It also automatically adjust the screen density and disables the Gboard keyboard with Null Keyboard. Then when you close the scrcpy window, the script changes the screen density, enables Gboard Keyboard and Niagara Launcher becomes the default launcher.

![screenshot](Screenshots/0.jpg)
### Instructions Tips:
First of all, you need to have USB Debugging enabled on your phone to get everything working.

In the batch script you must replace `DEVICE_ID` with the ID or IP of your device.

In Taskbar Launcher, you must activate "Replace Home Screen".


### Useful Notes: 
You can change render driver between opengl and direct3d on `--render-driver=direct3d`.

If you have lag issues, try to play with `-m1360` and `-b10M`.

WIRELESS SCRIPT: `Screen Time Out value 60000 = 1 minute`.
 
You can play with your phone resolution and aspect ratio using `adb shell wm size`.

Please check the keyboard you are using to avoid language problems
 
Font Scale Values:
 - Small: `0.85`
 - Default: `1.0`
 - Large: `1.15`
 - Lagest: `1.30`

If you're using Exagear, you may find helpful to add "--forward-all-clicks" to the Scrcpy line for better mouse compatibility.

Do you use another launcher? Check [Alternative Launchers Commands](https://github.com/Blakenidby/scrcpy_script/blob/50e88375989b7d168b08204c75918ff8dfd56b61/Alternative%20launchers.md)
### More Information: 
For more shortcuts/commands, check [Scrcpy repository](https://github.com/Genymobile/scrcpy) and [ADB commands](https://gist.github.com/Pulimet/5013acf2cd5b28e55036c82c91bd56d8).

[Telegram Group](https://t.me/ScrcpyDesktop)

[Demostration video](https://youtu.be/n6CgGz_69eI)
### This batch script need the below elements to work:
* [Scrcpy](https://github.com/Genymobile/scrcpy)
* [Taskbar Launcher](https://github.com/farmerbb/Taskbar)
* [Niagara Launcher](https://github.com/8bitPit/Niagara-Issues)
* [Null Keyboard - Only available on Telegram Group]
* [Gboard](https://play.google.com/store/apps/details?id=com.google.android.inputmethod.latin&hl=en)
