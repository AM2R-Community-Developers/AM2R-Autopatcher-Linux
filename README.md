# AM2R Autopatcher for Linux
This utility patches the official AM2R 1.1 release (Windows) to the fan-made Community Update (Linux).

## Dependencies
The patcher and the installer require several dependencies depending on the distro you are currently using.
As is always the case on Linux, please make sure that your packages and your package list are up-to-date.

### Arch (including Manjaro, EndeavourOS, RebornOS etc.)
Make sure that multilib is enabled, as Arch does not do so by default and this is a 32-bit application.
To enable it, go to `/etc/pacman.conf`, search for `[multilib]`, and make sure that both this and the next line are uncommented:
`sudo pacman -S --needed python xdelta3 lib32-openal lib32-openssl-1.0 lib32-libcurl-compat lib32-libpulse lib32-gcc-libs lib32-libxxf86vm lib32-libglvnd lib32-libxrandr lib32-glu`

### Debian (including Ubuntu, Mint, PopOS, etc)
`sudo apt install python xdelta3 libc6:i386 libstdc++6:i386 zlib1g-dev:i386 libxxf86vm1:i386 libcurl3:i386 libopenal1:i386 libxrandr2:i386 libglu1:i386 jstest-gtk joystick` 

### Fedora
`sudo dnf install python xdelta openal-soft compat-openssl10`


## Linux patching process
To patch your copy of (Windows) AM2R v1.1, place the `AM2R_11.zip` (case-sensitive) file in the same folder as `patcher.py`. After installing the required dependencies for the version you would like to patch to, execute `patcher.py` via `python patcher.py`.

## Android patching process
In addition to the above packages, two more dependencies are required for Android support: AAPT and at Java JDK 8. AAPT is part of the Android SDK and is rarely found in package managers. Your best option would be to use Android Studio in order to install the SDK, or use the binary provided [here](https://androidaapt.com/) and place it somewhere recognizable by path (Either make an alias for it, or place it i.e. to /usr/local/bin).

## After patching
Navigate to the newly created folder. After that, if you want to launch AM2R via command line, make sure to do it like this: `env "LD_PRELOAD=libcurl.so.3" ./AM2R`.  
However, there is also a .desktop file included (this one has the AM2R logo). You can just double click on that in order to start the game.

If you cannot run AM2R after installing the packages, use `ldd` in order to find out which packages are missing. If you still cannot resolve the missing dependencies, or you have other questions/issues, please open an issue, post to [r/AM2R](https://www.reddit.com/r/AM2R/), or join the [Official AM2R Discord Server](https://discord.gg/YTQnkAJ).
As a last resort, you can always play the Windows version on Linux via Wine or Proton.

## Android installation instructions
You will need an Android device with a file explorer application installed, and a USB cable to connect said device to your computer.

1. Enable installation of apps from third party sources on your Android device. The location of this setting varies from device to device; our example device has it under the Security Settings, but some may place it under Application Settings or another location.
The option is usually called "Unknown Sources" and may need to be searched for.
2. Connect your phone to your computer with the USB cable. Select "Media Transfer" on the popup window displayed on your Android device.
3. Mount your phone (either via a file manager or via a terminal), and go to where it's mounted.
Move `AndroidM2R_1X_X-signed.apk` to a location such as the Downloads folder of the Android device.
4. Disconnect the Android device, and open the device's file explorer app. Locate and open `AndroidM2R_1X_X-signed.apk`.
This should prompt you to install the application; after this point it should behave like any other app.
