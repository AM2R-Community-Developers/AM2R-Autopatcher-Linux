# AM2R Autopatcher for Linux
This utility patches the official AM2R 1.1 release (Windows) to the fan-made Community Update (Linux).

## Dependencies
The patcher and the installer only require a small amount of dependencies. Note that the Java-related packages (`java` / `jre` / `jdk`) packages are only required for building an Android APK.

### Arch (including Manjaro, EndeavourOS, RebornOS, etc.)
Make sure that multilib is enabled, as `lib32-libpulse` is a 32-bit library and Arch does not enable 32-bit support by default.
To enable it, go to `/etc/pacman.conf`, search for `[multilib]`, and make sure that the next two lines are uncommented:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Then install the following dependencies:  
`sudo pacman -S --needed unzip sed patchelf xdelta3 jre8-openjdk lib32-libpulse`


### Debian (including Ubuntu, Mint, PopOS, etc.)
Make sure you enable the i386 architecture, as `libopenal1` requires the 32-bit version and Ubuntu does not enable 32-bit support by default.
To enable it, do the following:
```
sudo dpkg --add-architecture i386
sudo apt update && sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 libopenal1:i386
```

Then install the following dependencies:  
`sudo apt install unzip sed xdelta3 patchelf openjdk-8-jre`

### Nix (Including NixOS)
Enter a shell with all the required dependencies to run the script:
`nix shell nixpkgs#{gnused,unzip,xdelta,patchelf,jre}`

Note that the AppImage will **not** work on NixOS. Please follow the instructions in the manual installation section.

### Red Hat (including Fedora)
`sudo yum unzip sed xdelta patchelf java-1.8.0-openjdk`

### Suse
`sudo zypper unzip sed xdelta3 patchelf java-1_8_0-openjdk`

## Controllers
In order to use a controller on some distributions, the two following packages are *mandatory*:
- jstest-gtk
- joystick

## Linux and Android patching process
To patch your copy of (Windows) AM2R v1.1, place the `AM2R_11.zip` (case-sensitive) file in the same folder as `patcher.sh`. After installing the required dependencies for the version you would like to patch to, execute the patching script via `./patcher.sh`.
During the installation you will be asked, if you want to patch it for Linux or Android. Press the corresponding number for that.

If no arguments are applied, the patching script will run as *interactive* mode. For a list of all arguments for headless mode, run `./patcher.sh --help`.

## After patching
Navigate to the newly created folder. 

If you have other questions/issues, please open an issue, post to [r/AM2R](https://www.reddit.com/r/AM2R/), join the [Official AM2R Discord Server](https://discord.gg/YTQnkAJ) or join the [Official AM2R Matrix Space](https://matrix.to/#/#am2r:matrix.org).

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

## Manual installation
Manual installation should not be used without due cause. Unless you have a very good reason for avoiding AppImages, please use the default installation instead!
If you cannot run AM2R after installing the packages, use `ldd` in order to find out which packages are missing.

### Dependencies
As said above, these dependencies are **only** needed if you want to run the game natively.

### Arch (including Manjaro, EndeavourOS, RebornOS, etc.)
Make sure that multilib is enabled, as this is a 32-bit application and Arch does not do so by default.
To enable it, go to `/etc/pacman.conf`, search for `[multilib]`, and make sure that both this and the next line are uncommented. After that, install the following packages:  
`sudo pacman -S --needed unzip patchelf sed xdelta3 lib32-openal lib32-libcurl lib32-libpulse lib32-gcc-libs lib32-libxxf86vm lib32-libglvnd lib32-libxrandr lib32-glu`

### Debian (including Ubuntu, Mint, PopOS, etc.)
Make sure you enable the i386 architecture, as `libopenal1` requires the 32-bit version and Ubuntu does not enable 32-bit support by default.
To enable it, do the following:
```
sudo dpkg --add-architecture i386
```
After that you can run this:
`sudo apt install unzip patchelf sed xdelta3 libc6:i386 libstdc++6:i386 zlib1g-dev:i386 libxxf86vm1:i386 libcurl:i386 libopenal1:i386 libxrandr2:i386 libglu1:i386`

### Nix (Including NixOS)
After installation, the game can be run using the `steam-run` FHS environment. This avoids having to patch the dynamic linker and dynamically linked libraries. You can run it with the following command:
`NIXPKGS_ALLOW_UNFREE=1 nix shell --impure nixpkgs#steam-run --command steam-run ./runner`

### Red Hat (including Fedora)
`sudo yum install unzip sed xdelta openal-soft patchelf`
