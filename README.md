# AM2R Autopatcher for Linux

## Known dependencies
> Please note that, depending on your operating system, you may require different dependencies. The following list is targeted at Debian-based systems, and is not guaranteed to be exhaustive. `ldd` is your friend.

Patching to Linux:
- Python 3
- xdelta3 (Ubuntu package)

Patching to Android:
- Python 3
- xdelta3 (Ubuntu package)
- AAPT
- Java JDK 8

AM2R:
- libc6:i386
- libstdc++-6-dev:i386
- zlib1g-dev:i386
- libxxf86vm1:i386
- libgl1-mesa-glx:i386
- libcurl3:i386
- libopenal1:i386
- libxrandr2:i386
- libglu1:i386
- libidn11:i386
- libssl1.0.0:i386

Controller support:
- jstest-gtk
- joystick

To patch your copy of AM2R v1.1, place the `AM2R_11.zip` folder in the same folder as `patcher.py`. After installing the required dependencies for the version you would like to patch to, execute `patcher.py` via Python 3.

The guided script should walk you through the rest of the patching process. Be sure to flag AM2R as an executable before attempting to launch it. If nothing happens, you're likely missing dependencies; `ldd` is your friend.

**NOTE:** To launch AM2R, you may need to preload `libcurl.so.3`.

```bash
env "LD_PRELOAD=libcurl.so.3" ./AM2R
```

Questions/issues regarding the patching process or AM2R in general should be forwarded to [r/AM2R](https://www.reddit.com/r/AM2R/) or the [Official AM2R Discord Server](https://discord.gg/YTQnkAJ).

## Post-patch Arch Linux setup instructions (courtesy of u/Genex_04)

1. Enable the multilib repo by editing `/etc/pacman.conf` as root and uncomment the two multilib repository lines (remove the `#` in front of these lines in the file)
    ```
    [multilib]
    Include = /etc/pacman.d/mirrorlist-arch
    ```
1. Run `pacman -Sy` to synchronize the repository.
1. Locate your AM2R executable and run `ldd AM2R`; this will show you the missing dependencies
    1. For each missing dependency, run `pacman -Fy <library name>`. This will tell you which package contains that library.
    1. You then need to install that package in the multilib repository. For example, the `libcrypto.so.1.0.0` library would require you to install `multilib/lib32-openssl-1.0 1.0.2.u-1`
1. Once all the libraries are installed, you can launch AM2R with `env "LD_PRELOAD=libcurl.20.3" ./AM2R`

**OPTIONAL:** You can make a simple script with `env "LD_PRELOAD=libcurl.so.3" ./AM2R` inside and make it executable so you don't have to type the full command every time.

## Android installation instructions

You will need an Android device with a file explorer application installed, and a USB cable to connect said device to your computer.

1. Enable installation of apps from third party sources on your Android device. The location of this setting varies from device to device; my phone has it under the Security Settings, but some may place it under Application Settings.
The option is usually called "Unknown Sources" and may be searched for.
1. Connect your phone to your computer with the USB cable. Select "Media Transfer" on the popup window displayed on your Android device.
1. Go to "This PC" on your computer's file explorer and open the Android device folder that shows up.
Move `AndroidM2R_15_2-signed.apk` to a location such as the Downloads folder of the Android device.
1. Disconnect the Android device, and open the device's file explorer app. Locate and open `AndroidM2R_15_2-signed.apk`.
This should prompt you to install the application; after this point it should behave like any other app.
