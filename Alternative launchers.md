## Launchers
Here's a list of adb commands to use the script with alternative launchers. New suggestions are welcome :)

#### Default Launchers:
 - Taskbar Launcher:
`adb -s DEVICE_ID shell cmd package set-home-activity com.farmerbb.taskbar/.activity.HomeActivity`

 - Niagara Launcher:
`adb -s DEVICE_ID shell cmd package set-home-activity bitpit.launcher/.ui.HomeActivity`

#### Desktop Mode:
 - Sentio Launcher:
`adb -s DEVICE_ID shell am start -n com.sentio.desktop/com.sentio.ui.splash.SplashActivity`


#### Phone Mode:
 - Microsoft Launcher:
`adb -s DEVICE_ID shell Testing`
