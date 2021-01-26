# AM2R Autopatcher for Linux
This utility patches the fan-made community versions over the released 1.1 version of AM2R on Linux.

## Dependencies
The patcher and the installer requires several dependencies, depending on the distro you are currently using.
As it's the case on Linux, please make sure that your packages and your package list are up-to-date. 

### Arch (including Manjaro, EndeavourOS, RebornOS etc.)
As Arch doesn't do it normally, make sure that the multilib is enabled, as this is a 32-bit application.
To enable it, go to `/etc/pacman.conf` search for `[multilib]` and make sure, that both this and the next line is uncommented.
`sudo pacman -S --needed python xdelta3 lib32-openal lib32-openssl-1.0 lib32-libcurl-compat lib32-libpulse lib32-gcc-libs lib32-libxxf86vm lib32-libglvnd lib32-libxrandr lib32-glu`

### Debian (including Ubuntu, Mint, PopOS, etc)
`sudo apt install python xdelta3 libc6:i386 libstdc++6:i386 zlib1g-dev:i386 libxxf86vm1:i386 libcurl3:i386 libopenal1:i386 libxrandr2:i386 libglu1:i386 jstest-gtk joystick` 

### Fedora
TODO

### OpenSuse
TODO
