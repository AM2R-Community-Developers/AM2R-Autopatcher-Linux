# AM2R Autopatcher for Linux
This utility patches the fan-made community versions over the released 1.1 version of AM2R on Linux.

## Dependencies
The patcher and the installer requires several dependencies, depending on the distro you are currently using.
As it's the case on Linux, please make sure that your packages and your package list are up-to-date. 

### Arch (including Manjaro, EndeavourOS, RebornOS etc.)
As Arch doesn't do it normally, make sure that multilib is enabled, as this is a 32-bit application.<br>
To enable it, go to `/etc/pacman.conf` search for `[multilib]` and make sure, that both this and the next line is uncommented.
`sudo pacman -S --needed python xdelta3 lib32-openal lib32-openssl-1.0 lib32-libcurl-compat lib32-libpulse lib32-gcc-libs lib32-libxxf86vm lib32-libglvnd lib32-libxrandr lib32-glu`

### Debian (including Ubuntu, Mint, PopOS, etc)
`sudo apt install python xdelta3 libc6:i386 libstdc++6:i386 zlib1g-dev:i386 libxxf86vm1:i386 libcurl3:i386 libopenal1:i386 libxrandr2:i386 libglu1:i386 jstest-gtk joystick` 

### Fedora
`sudo dnf install python xdelta openal-soft compat-openssl10`


## Linux Patching process
To patch your copy of AM2R v1.1, place the `AM2R_11.zip` (case-sensitive) file in the same folder as `patcher.py`. After installing the required dependencies for the version you would like to patch to, execute `patcher.py` via `python patcher.py`.

## Android Patching process
For this, two more dependencies are required, AAPT and at Java JDK 8. AAPT is part of the Android SDK and is rarely in a package manager. Your best option would be to use Android Studio in order to install the SDK, or use the binary provided [here](https://androidaapt.com/) and place it somewhere recognizable by path (Either make an alias for it, or place it i.e. to /usr/local/bin).

## After Patching
Navigate to the newly created folder. After that, if you want to launch AM2R via command line, make sure to do it like this: `env "LD_PRELOAD=libcurl.so.3" ./AM2R`.
However, there is also a .desktop file included (this one has the AM2R logo). So you can just double click on that, in order to start it.

If after installing the packages, you still can't run AM2R, use `ldd` in order to find out which packages are missing. If that happens, or you have other questions/issues, please file an issue, or ask in either [r/AM2R](https://www.reddit.com/r/AM2R/) or the [Official AM2R Discord Server](https://discord.gg/YTQnkAJ).
As a last resort, you can always play it via Wine or Proton.

## Android installation instructions
You will need an Android device with a file explorer application installed, and a USB cable to connect said device to your computer.

1. Enable installation of apps from third party sources on your Android device. The location of this setting varies from device to device; my phone has it under the Security Settings, but some may place it under Application Settings.
The option is usually called "Unknown Sources" and may need to be searched for.
1. Connect your phone to your computer with the USB cable. Select "Media Transfer" on the popup window displayed on your Android device.
1. Mount your phone (either via a file manager or via a terminal), and and go to where it's mounted
Move `AndroidM2R_1X_X-signed.apk` to a location such as the Downloads folder of the Android device.
1. Disconnect the Android device, and open the device's file explorer app. Locate and open `AndroidM2R_1X_X-signed.apk`.
This should prompt you to install the application; after this point it should behave like any other app.
