# AM2R Autopatcher for Linux
This utility patches the official AM2R 1.1 release (Windows) to the fan-made Community Update (Linux).

## Dependencies
The patcher and the installer require several dependencies depending on the distro you are currently using.
As is always the case on Linux, please make sure that your packages and your package list are up-to-date.

### Arch (including Manjaro, EndeavourOS, RebornOS, etc.)
Make sure that multilib is enabled, as this is a 32-bit application and Arch does not do so by default.
To enable it, go to `/etc/pacman.conf`, search for `[multilib]`, and make sure that both this and the next line are uncommented. After that, install the following packages:  
`sudo pacman -S --needed python xdelta3 lib32-openal lib32-openssl-1.0 lib32-libcurl-compat lib32-libpulse lib32-gcc-libs lib32-libxxf86vm lib32-libglvnd lib32-libxrandr lib32-glu`

### Debian (including Ubuntu, Mint, PopOS, etc.)
`sudo apt install python xdelta3 libc6:i386 libstdc++6:i386 zlib1g-dev:i386 libxxf86vm1:i386 libcurl3:i386 libssl1.0:i386 libopenal1:i386 libxrandr2:i386 libglu1:i386`  

On newer versions (Debian 10+ or Ubuntu 18+) you may have to do the below command instead. Please make sure first, that you neither have `libcurl3` nor `libcurl4` installed.  
`sudo apt install python python3 xdelta3 libc6:i386 libstdc++6:i386 zlib1g-dev:i386 libxxf86vm1:i386 libxrandr2:i386 libglu1:i386 && http://archive.ubuntu.com/ubuntu/pool/universe/c/curl3/libcurl3_7.58.0-2ubuntu2_i386.deb && sudo dpkg -i libcurl3_7.58.0-2ubuntu2_i386.deb && wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.5_i386.deb && sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.5_i386.deb && rm libssl1.0.0_1.0.2n-1ubuntu5.5_i386.deb libcurl3_7.58.0-2ubuntu2_i386.deb`

### Fedora
`sudo dnf install python xdelta openal-soft compat-openssl10`

## Linux patching process
To patch your copy of (Windows) AM2R v1.1, place the `AM2R_11.zip` (case-sensitive) file in the same folder as `patcher.sh`. After installing the required dependencies for the version you would like to patch to, execute `patcher.sh` via `./patcher.sh`.

## Android patching process
In addition to the above packages, you need to have at least Java JDK 8 installed although this should be preinstalled on most systems. If it isn't, search your local package manager for `openjdk-`.  
Make sure you have it installed, and then follow the linux patching instructions, but choose the Android option instead.

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

If for some reason, you are not able to access your phone, you can use the adb (android-debug-bridge) instead:
1. On your phone, make sure, that developer options are enabled. If they aren't move to the `About Phone` section, search for your build number, and click on it 7 times.
2. Plug in your phone via a USB-cable, go to the developer settings, enable the `USB Debugging` option and trust your Computer.
3. Install the adb package. The name is different from distro to distro, so search your local package manager for `adb` or `android-tools`.
4. Open a terminal and type `adb devices`. This should show your phone. If it does, type `adb install [path-to-apk]`.
