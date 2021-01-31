VERSION="15_2"
OUTPUT="am2r_"${VERSION}
INPUT=""
 
if [ -d "utilities/android/assets" ]; then
    rm -r "utilities/android/assets"
fi

if [ -d "$OUTPUT" ]; then
    rm -r ${OUTPUT}
fi

echo "-------------------------------------------"
echo ""
echo "AM2R 1.5.1 Shell Autopatching Utility"
echo "Scripted by Miepee and help from Lojemiru"
echo ""
echo "-------------------------------------------"

#check for AM2R_11.zip
if [ -f "AM2R_11.zip" ]; then
    echo "AM2R_11.zip found! Extracting to ${OUTPUT}"
    #extract the content to the am2r_xx folder
    unzip -q AM2R_11.zip -d "${OUTPUT}"
else
    #if the zip is not found, maybe the directory is
    #in which case, copy that one to the am2r_xx folder
    if [ -d "AM2R_11" ]; then
        echo "AM2R_11 found! Copying to ${OUTPUT}"
        cp -RT AM2R_11 ${OUTPUT}
    else
        echo "AM2R_11 not found. Place AM2R_11.zip (case sensitive) in this folder and try again."
        exit -1
    fi
fi

echo "Select your patch type:"
echo ""
echo "1 - Linux"
echo "2 - Android"
echo ""
echo "Awating input:"

read -n1 INPUT
echo ""
#determine type
if [ $INPUT = "1" ]; then
    echo "Linux selected"
    echo "Applying AM2R patch..."
    xdelta3 "-dfs" "${OUTPUT}/AM2R.exe" "patch_data/AM2R.xdelta" "${OUTPUT}/AM2R"
    
    echo "Applying data patch..."
    xdelta3 "-dfs" "${OUTPUT}/data.win" "patch_data/game.xdelta" "${OUTPUT}/game.unx"
    
    #clean up Windows files
    echo "Cleaning up residual AM2R 1.1 files..."
    rm "${OUTPUT}/AM2R.exe" "${OUTPUT}/data.win"
    
    #structure for Linux
    echo "Formatting Game directory..."
    mkdir "${OUTPUT}/assets"
    mv ${OUTPUT}/*.* "${OUTPUT}/assets/"
    
    #install new datafiles...
    echo "Installing new datafiles..."
    #copy music
    cp patch_data/files_to_copy/*.ogg "${OUTPUT}/assets/"

    
    echo "Install high quality in-game music? Increases filesize by 194 MB!"
    echo "[y/n]"
    
    read -n1 INPUT
    echo ""
    if [ $INPUT = "y" ]; then
        echo "Copying HQ music..."
        cp patch_data/HDR_HQ_in-game_music/*.ogg "${OUTPUT}/assets/"
    fi
    
    #format music for linux aka lowercase it
    #https://stackoverflow.com/a/25590300 for clarification. Was the most simple way to do it
    #TODO "save all the filenames in an array, then do it in a loop" -MG
    # or this https://discord.com/channels/743561035981783192/743561083788197969/805422798071267378
    zip -0qr temp.zip "${OUTPUT}"/assets/*.ogg
    rm "${OUTPUT}"/assets/*.ogg
    unzip -qLL temp.zip
    rm temp.zip

    #remove old lang and install new lang, mods, text, modifiers and icons
    rm -R "${OUTPUT}"/lang
    cp -RT patch_data/files_to_copy/lang "${OUTPUT}"/assets/lang
    cp -RT patch_data/files_to_copy/mods "${OUTPUT}"/assets/mods
    cp patch_data/files_to_copy/*.txt patch_data/files_to_copy/modifiers.ini patch_data/files_to_copy/icon.png patch_data/files_to_copy/splash.png "${OUTPUT}"/assets
    
    #make game executable
    chmod +x "${OUTPUT}"/AM2R
    
    echo "Do you want to install AM2R systemwide?"
    echo "[y/n]"
    
    read -n1 INPUT
    echo ""
    
    if [ $INPUT = "y" ]; then
        #install to /usr/local/bin
        sudo mkdir -p /usr/local/bin/am2r/
        sudo cp -RTp "${OUTPUT}" /usr/local/bin/am2r/
        FILECONTENT=$(cat DesktopTemplate)
        FILECONTENT=${FILECONTENT//\[REPLACE\]//usr/local/bin/am2r}
        printf "%s" "${FILECONTENT}" > "${OUTPUT}"/AM2R.desktop  
        sudo cp -p "${OUTPUT}"/AM2R.desktop /usr/share/applications/AM2R.desktop
        #we could chmod ./AM2R in the install folder, but it's not necessary
    else
        #creating local desktop file
        FILEPATH="${OUTPUT}"/AM2R.desktop
        FILECONTENT=$(cat DesktopTemplate)
        FILECONTENT=${FILECONTENT//\[REPLACE\]/"${PWD}"/"${OUTPUT}"}
        printf "%s" "${FILECONTENT}" > "${FILEPATH}"
        #make the desktopFile executable. For some reason, this is not necessary, when copying it into /applications
        chmod +x "${FILEPATH}"
    fi
    
    echo "Desktop file has been created!"

elif [ $INPUT = "2" ]; then
    echo "Android selected."
    echo "Applying data patch..."
    
    echo "Applying Android patch..."
    xdelta3 -dfs "${OUTPUT}"/data.win patch_data/droid.xdelta  "${OUTPUT}"/game.droid
    cp patch_data/android/AM2RWrapper.apk utilities/android/
    
    rm "${OUTPUT}"/D3DX9_43.dll "${OUTPUT}"/AM2R.exe "${OUTPUT}"/data.win 
    
    cp -RTp "${OUTPUT}"/ utilities/android/assets/
    cp -p patch_data/android/AM2R.ini utilities/android/assets/
    
    # Install new datafiles...
    echo "Installing new datafiles..."
    
    # Music
    mkdir -p utilities/android/assets/lang
    cp patch_data/files_to_copy/*.ogg utilities/android/assets/
    
    echo "Install high quality in-game music? Increases filesize by 194 MB!"
    echo ""
    echo "[y/n]"
    
    read -n1 INPUT
    echo ""
    
    if [ $INPUT = "y" ]; then
        echo "Copying HQ music..."
        cp patch_data/HDR_HQ_in-game_music/*.ogg utilities/android/assets/
    fi
    #remove old lang
    rm -R utilities/android/assets/lang/
    #install new lang
    cp -RTp patch_data/files_to_copy/lang/ utilities/android/assets/lang/
    #copy text and modifiers
    cp -p patch_data/files_to_copy/*.txt patch_data/files_to_copy/modifiers.ini utilities//android/assets/
    
    #zip -0qr temp.zip utilities/android/assets/*.ogg
    #rm utilities/android/assets/*.ogg
    #unzip -qLL temp.zip
    #rm temp.zip
    
    cd utilities/android/
    
    echo "Packaging APK..."
    echo "If Java JDK 8 or newer is not present, this will fail!"
    #decompile the apk
    java -jar ./apktool.jar d -f AM2RWrapper.apk
    #copy
    cp -Rp assets AM2RWrapper
    #build
    java -jar ./apktool.jar b AM2RWrapper -o AM2RWrapper.apk
        
    echo "Signing APK..."
    java -jar uber-apk-signer.jar -a AM2RWrapper.apk 
    # Cleanup
    rm -R AM2RWrapper.apk assets/ ../../"${OUTPUT}" AM2RWrapper/
    # Move APK
    mv AM2RWrapper-aligned-debugSigned.apk ../../AndroidM2R_"${VERSION}"-signed.apk 
else
    echo "Invalid input. Exiting..."
    exit -1
fi

echo "The operation was completed successfully. See you next mission!"
