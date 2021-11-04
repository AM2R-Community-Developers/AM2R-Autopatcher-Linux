from zipfile import ZipFile
import os.path
from os import remove, mkdir, rename
from shutil import copy, copytree, rmtree, move
import glob
import subprocess

version = '15_5'

output = 'am2r_' + version


# Thanks, stackoverflow
def _find_getch():
    try:
        import termios
    except ImportError:
        # Non-POSIX. Return msvcrt's (Windows') getch.
        import msvcrt
        return msvcrt.getch

    # POSIX system. Create and return a getch that manipulates the tty.
    import sys, tty
    def _getch():
        fd = sys.stdin.fileno()
        old_settings = termios.tcgetattr(fd)
        try:
            tty.setraw(fd)
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch

    return _getch

getch = _find_getch()
# End stackoverflow code


# Residual file cleanup to prevent accidents
if os.path.isdir('utilities/android/assets'):
    rmtree('utilities/android/assets')

if os.path.isdir(output):
    rmtree(output)

if os.path.isdir("ARCHIVE-"+output):
    rmtree("ARCHIVE-"+output)

if os.path.isdir('AM2R.AppDir'):
    rmtree('AM2R.AppDir')

print("-------------------------------------------\n\nAM2R 1.5.5 Python Autopatching Utility\nScripted by Lojemiru\n\n-------------------------------------------\n")

# Check for AM2R_11.zip...
if os.path.isfile('AM2R_11.zip'):
    print("AM2R_11.zip found! Extracting to " + output)
    # Unzip AM2R_11.zip
    try:
        with ZipFile('AM2R_11.zip', 'r') as zipObj:
           # Extract all the contents of zip file in current directory
           zipObj.extractall(output)
    except:
        print("AM2R_11.zip failed to extract. Try unzipping the folder and run this utility again.")
        quit()
else:
    if os.path.isdir('AM2R_11'):
        print("AM2R_11 found! Copying to " + output)
    else:
        print("AM2R_11 not found. Place AM2R_11.zip (case sensitive) in this folder and try again.")
        quit()

print("\nSelect your patch type:\n\n1 - Linux\n2 - Android\n\nAwaiting input:\n")

type = getch()

# Determine type
if (type == '1'):
    print("Linux selected.\nApplying AM2R patch...")
    # apply AM2R.bps
    # subprocess.call(['utilities/floating/./flips-linux', '-a', 'data/AM2R.bps', output+'/AM2R.exe', output+'/AM2R'])
    subprocess.call(['xdelta3', '-dfs', output+'/AM2R.exe', 'data/AM2R.xdelta', output+'/AM2R'])

    print("\nApplying data patch...")
    # apply game.unx patch
    # subprocess.call(['utilities/floating/./flips-linux', '-a', 'data/game.bps', output+'/data.win', output+'/game.unx'])
    subprocess.call(['xdelta3', '-dfs', output+'/data.win', 'data/game.xdelta', output+'/game.unx'])

    # clean up Windows files
    print("\nCleaning up residual AM2R 1.1 files...")
    remove(output+'/AM2R.exe')
    remove(output+'/data.win')

    # structure for Linux

    print("\nFormatting game directory...")
    os.mkdir(output+'/assets')

    for z in glob.glob(output+'/*.*'):
        move(z, output+'/assets')

    # install new datafiles...
    print("\nInstalling new datafiles...")
    
    # copy the whole files_to_copy folder over
    for file2 in glob.glob("data/files_to_copy/*"):
        if (os.path.isdir(file2)):
            copytree(file2, output+"/assets/"+os.path.basename(file2))
        else:
            copy(file2, output+'/assets')

    print("\nInstall high quality in-game music? Increases filesize by 194 MB!\n\n[y/n]\n")

    hq = getch()

    # install HQ music
    if (hq == 'y'):
        print("Copying HQ music...")
        for file in glob.glob("data/HDR_HQ_in-game_music/*.ogg"):
            copy(file, output+'/assets')

    # format music for linux
    print("Formatting music files for Linux application recognition...")

    for music in glob.glob(output+'/assets/*.ogg'):
        rename(music, music.lower())

    # remove old lang
    rmtree(output+'/lang')
    
    #make game executable
    subprocess.call(["chmod", "+x", output+"/AM2R"])

    #create AppImage
    print("Creating Appimage...")
    copytree("data/AM2R.AppDir", "AM2R.AppDir", symlinks=True)
    subprocess.call(["cp", "-rpT", output , "AM2R.AppDir/usr/bin"])
    fd = os.open("/dev/null", os.O_WRONLY)
    savefd = os.dup(2)
    os.dup2(fd,2)
    subprocess.call(["sh", "./AppImageCreation.sh", "-n"])
    os.dup2(savefd,2)
    rename("AM2R-x86_64.AppImage", "AM2R.AppImage")
    rmtree("AM2R.AppDir")
    
    #rename the output to archive, so we only have a new folder, containing the appimage and a desktop file for it
    rename(output, "ARCHIVE-"+output)
    mkdir(output)
    move("AM2R.AppImage", output+"/AM2R.AppImage")
    copy("data/files_to_copy/icon.png", output+"/icon.png")
    
    
    #check if current OS is a fork of Debian
    isDebianFork = 0
    catOutput = subprocess.check_output(("cat", "/etc/os-release"))
    catOutput = str(catOutput)
    grep = "ID_LIKE=debian"
    isDebianFork = catOutput.find(grep) >= 0
    
    #if not debian, check for ubuntu instead
    if(not isDebianFork):
        grep = "ID_LIKE=ubuntu"
        isDebianFork = catOutput.find(grep) >= 0
    
    #cehck if current OS uses intel as gpu
    isIntelGPU = 0
    lspciOutput = subprocess.check_output(("lspci"))
    lspciOutput = str(catOutput)
    grep = "VGA compatible controller: Intel"
    isIntelGPU = lspciOutput.find(grep) >= 0
    
    
    print("\nDo you want to install AM2R systemwide?\n\n[y/n]\n")
    inp = getch()

    if( inp == 'y'):
        #install it to /usr/local/bin
        
        #first, create the folder in case it's not there
        subprocess.call(["sudo", "mkdir", "-p", "/usr/local/bin/am2r/"])
        #couldn't figure it out, how to do it with a normal cp command, so I just copy everything manually
        #except for /assets
        for file8 in glob.glob(output + "/*"):
            subprocess.call(["sudo", "cp", "-p", file8 , "/usr/local/bin/am2r/"])
        #subprocess.call(["sudo", "cp", "-rp", output+"/assets/" , "/usr/local/bin/am2r/"])
        template = open("DesktopTemplate", "r")
        fileContents = template.read()
        fileContents = fileContents.replace("[REPLACE]", "/usr/local/bin/am2r")
        
        if( isDebianFork and isIntelGPU):
            fileContents = fileContents.replace("Exec=", "Exec=LIBGL_DRI3_DISABLE=1 ")
        
        desktopFile = open(output+"/AM2R.desktop", "w+")
        desktopFile.seek(0)
        desktopFile.write(fileContents)
        subprocess.call(["chmod", "+x", output+"/AM2R.desktop"])
        subprocess.call(["sudo", "cp", "-fp", output+"/AM2R.desktop", "/usr/share/applications/AM2R.desktop"])
        #we could chmod ./AM2R in the install folder, but it's not really necessary
    else:
        #creating the desktop file for local
        cwd = os.getcwd()
        desktopFilePath = output+"/AM2R.desktop"
        copy("DesktopTemplate", desktopFilePath)
        desktopFile = open(desktopFilePath, 'r+')
        fileContents = desktopFile.read()
        fileContents = fileContents.replace("[REPLACE]", cwd+"/"+output)
        
        if( isDebianFork and isIntelGPU):
            fileContents = fileContents.replace("Exec=", "Exec=LIBGL_DRI3_DISABLE=1 ")
        
        desktopFile.seek(0)
        desktopFile.write(fileContents)
        #make the desktopFile executable. For some reason, this is not *necessary*, when copying it into /applications. 
        #But I'll do it anyways, because I want the local one to work as well
        subprocess.call(["chmod", "+x", desktopFilePath])

    print("Desktop file has been created!")

    if( isDebianFork and isIntelGPU):
        print("It has been detected, that you're running a fork of Debian along with an Intel GPU. Please use the provided .desktop File in order to launch the game.")
        print("Ignore this message, if you installed AM2R systemwide")

elif (type == '2'):
    print("Android selected.\nApplying data patch...")
    # To be completely honest I don't know why I made the Android patch work like this.
    # I'm going to revert it until I run into problems.

    # subprocess.call(['utilities/floating/./flips-linux', '-a', 'data/game.bps', output+'/data.win', output+'/game.unx'])
    # subprocess.call(['xdelta3', '-dfs', output+'/data.win', 'data/game.bps', output+'/game.unx'])

    print("\nApplying Android patch...")
    # subprocess.call(['utilities/floating/./flips-linux', '-a', 'data/droid.bps', output+'/game.unx', output+'/game.droid'])
    subprocess.call(['xdelta3', '-dfs', output+'/data.win', 'data/droid.xdelta', output+'/game.droid'])

    copy("data/android/AM2RWrapper.apk", "utilities/android/")

    remove(output+"/D3DX9_43.dll")
    remove(output+"/AM2R.exe")
    remove(output+"/data.win")
    # remove(output+"/game.unx")

    copytree(output, "utilities/android/assets")
    # Only copy the file over if it exists
    if (os.path.exists("data/android/AM2R.ini")):
        copy("data/android/AM2R.ini", "utilities/android/assets")

    # Install new datafiles...
    print("\nInstalling new datafiles...")
    # Music
    for file2 in glob.glob("data/files_to_copy/*.ogg"):
        copy(file2, 'utilities/android/assets')

    print("\nInstall high quality in-game music? Increases filesize by 194 MB!\n\n[y/n]\n")

    hq = getch()

    # Install HQ music
    if (hq == 'y'):
        print("Copying HQ music...")
        for file in glob.glob("data/HDR_HQ_in-game_music/*.ogg"):
            copy(file, 'utilities/android/assets')

    # Remove old lang
    rmtree('utilities/android/assets/lang')
    # Install new lang
    copytree('data/files_to_copy/lang', 'utilities/android/assets/lang')
    # Text
    for file3 in glob.glob("data/files_to_copy/*.txt"):
        copy(file3, 'utilities/android/assets')
    # Modifiers
    copy('data/files_to_copy/modifiers.ini', 'utilities/android/assets')

    os.chdir('utilities/android')

    print("\nPackaging APK.")
    print("If Java JDK 8 or newer is not present, this will fail!")
    #decompile the apk
    subprocess.call(["java", "-jar", "./apktool.jar", "d", "-f", "AM2RWrapper.apk"])
    #copy
    subprocess.call(["cp", "-r", "assets", "AM2RWrapper"])
    subprocess.call(["cp", "-f", "../../data/android/apktool.yml", "AM2RWrapper/apktool.yml"])
    #build
    subprocess.call(["java", "-jar", "./apktool.jar", "b", "AM2RWrapper", "-o", "AM2RWrapper.apk"])
        
    print("\nSigning APK...")
    subprocess.call(['java', '-jar', 'uber-apk-signer.jar', '-a', 'AM2RWrapper.apk'])
    # Cleanup
    remove('AM2RWrapper.apk')
    rmtree('assets')
    rmtree('../../'+output)
    rmtree('AM2RWrapper')
    # Move APK
    move('AM2RWrapper-aligned-debugSigned.apk', '../../AndroidM2R_'+version+'-signed.apk')

else:
    print("Invalid input. Exiting.")
    quit()


print("\nThe operation was completed successfully. See you next mission!")



