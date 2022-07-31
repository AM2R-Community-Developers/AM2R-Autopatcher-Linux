#!/usr/bin/env bash

# exit on any error to avoid showing everything was successfull even tho it wasnt
set -eou pipefail

# Patching user variables
OSCHOICE=""
AM2RZIP=""
HQMUSIC=false
SYSTEMWIDE=false
APPIMAGE=false
PREFIX=""

# Patching internal variables
# Since people are likely to double click on this, I need a way to get the script_dir
dirResult="$(dirname '${BASH_SOURCE[0]}')"
SCRIPT_DIR="$(realpath $dirResult)"
VERSION="1.5.5"
OUTPUT="${SCRIPT_DIR}/am2r_${VERSION}"
RESOURCES="${OUTPUT}/assets"

patch_am2r ()
{
	# Set prefix to default value if empty
	if [ -z "$PREFIX" ]; then
		if [ "$SYSTEMWIDE" = true ]; then
			PREFIX="/usr/local"
		else
			PREFIX="$SCRIPT_DIR"
		fi
	fi

	# We need to do variable adjustments based on the prefix
	if [ "$SYSTEMWIDE" = true ]; then
		OUTPUT="${PREFIX}/opt/am2r"
		RESOURCES="${OUTPUT}/assets"
	else
		OUTPUT="${PREFIX}/am2r_${VERSION}"
		RESOURCES="${OUTPUT}/assets"
	fi
	# Cleanup in case the dirs/files exists
	cleanupDirs=("$OUTPUT" "$SCRIPT_DIR/AM2R.AppDir" "$SCRIPT_DIR/AM2R-x86_64.AppImage" "$SCRIPT_DIR/AM2RWrapper/" "$SCRIPT_DIR/utilities/android/assets/" "$SCRIPT_DIR/AM2RWrapper.apk")
	rm -rf "${cleanupDirs[@]}"

	mkdir -p "$OUTPUT"
	mkdir -p "$RESOURCES"

	# Check for AM2R_11
	if [[ -f "$AM2RZIP" ]]; then
		echo "AM2R_11.zip found!"
		unzip -q "$AM2RZIP" -d "$OUTPUT"
	elif [[ -d "$AM2RZIP" ]]; then
		echo "AM2R_11 folder found!"
		cp -R "$AM2RZIP" "$OUTPUT"
	else
		echo "AM2R_11 not found! Please place AM2R_11.zip (case sensitive) into \"$SCRIPT_DIR\" or provide it via command line arguments and try again."
		return 1
	fi

	# Check for which OS we patch
	if [ "$OSCHOICE" = "linux" ]; then

		echo "Patching for Linux..."
		echo "Applying AM2R xdelta patch..."
		xdelta3 -dfs "$OUTPUT/AM2R.exe" "$SCRIPT_DIR/data/AM2R.xdelta" "$OUTPUT/runner"

		echo "Applying data xdelta patch..."
		xdelta3 -dfs "$OUTPUT/data.win" "$SCRIPT_DIR/data/game.xdelta" "$RESOURCES/game.unx"

		echo "Cleaning up residual AM2R 1.1 files..."
		rm "$OUTPUT/AM2R.exe" "$OUTPUT/data.win" "$OUTPUT/D3DX9_43.dll"

		echo "Formatting game directory..."
		# This won't move the runner, because doesn't have a dot
		mv $OUTPUT/*.* "$RESOURCES/"

		echo "Installing new datafiles..."
		cp -R "$SCRIPT_DIR"/data/files_to_copy/* "$RESOURCES/"

		if [ "$HQMUSIC" = true ]; then
			echo "Copying HQ music..."
			cp "$SCRIPT_DIR"/data/HDR_HQ_in-game_music/*.ogg "$RESOURCES/"
		fi

		# Format music for Unix, aka lowercase it
		# Finds every file, and if its not already lowercase, lowercases it.
		find "$RESOURCES" -type f -exec \
			bash -c 'target="{}";
				cd "$(dirname "${target}")";
				target="$(basename "${target}")";
				! [[ "${target}" = "${target,,}" ]] && mv "${target}" "${target,,}"' \;

		# Remove old lang folder
		rm -R "$OUTPUT"/lang

		chmod +x "$OUTPUT/runner"

		if [ "$SYSTEMWIDE" = true ]; then
			mkdir "$PREFIX/bin"
			ln -s "$OUTPUT/runner" "$PREFIX/bin/am2r"
		fi

		# Create .desktop file
		echo "Creating desktop file..."
		cp "$SCRIPT_DIR/data/files_to_copy/icon.png" "$OUTPUT/icon.png"
		desktopPath="$OUTPUT/AM2R.desktop"
		if [ "$SYSTEMWIDE" = true ]; then
			mkdir -p "$PREFIX/share/applications"
			desktopPath="$PREFIX/share/applications/AM2R.desktop"
		fi
		cp "$SCRIPT_DIR/DesktopTemplate" "$desktopPath"

		# replace [REPLACE] with OUTPUT.Replace("/", "\/") in desktop file
		sed -i "s/\[REPLACE\]/${OUTPUT//\//\\\/}/" "$desktopPath"

		# If we don't want to create an AppImage, we're done.
		if [ "$APPIMAGE" = false ]; then
			# For non-appimage, the desktop file should point to runner
			sed -i "s/AM2R.AppImage/runner/" "$desktopPath"
			echo ""
			echo "The operation was completed successfully. See you next mission!"
			return 0
		fi

		# Create AppImage
		echo "Creating AppImage..."
		cp -R --preserve=links "$SCRIPT_DIR/data/AM2R.AppDir" "$SCRIPT_DIR/AM2R.AppDir"
		mv "$OUTPUT" "$SCRIPT_DIR/AM2R.AppDir/bin"
		ARCH=x86_64 "$SCRIPT_DIR/utilities/appimagetool-x86_64.AppImage" -n AM2R.AppDir 2> /dev/null

		mkdir "$OUTPUT"
		mv "$SCRIPT_DIR/AM2R-x86_64.AppImage" "$OUTPUT/AM2R.AppImage"
		mv "$SCRIPT_DIR/AM2R.AppDir/bin/icon.png" "$OUTPUT/icon.png"
		if [ "$SYSTEMWIDE" = false ]; then
			mv "$SCRIPT_DIR/AM2R.AppDir/bin/AM2R.desktop" "$desktopPath"
		fi
		rm -R "$SCRIPT_DIR/AM2R.AppDir"

	elif [ "$OSCHOICE" = "android" ]; then
		echo "Creating an APK for Android..."
		apktoolPath="$SCRIPT_DIR/utilities/android/apktool.jar"
		uberPath="$SCRIPT_DIR/utilities/android/uber-apk-signer.jar"

		echo "Applying Android patch..."
		xdelta3 -dfs "$OUTPUT/data.win" "$SCRIPT_DIR/data/droid.xdelta" "$OUTPUT/game.droid"

		cp "$SCRIPT_DIR/data/android/AM2RWrapper.apk" "$SCRIPT_DIR/utilities/android/"
		rm "$OUTPUT/D3DX9_43.dll" "$OUTPUT/AM2R.exe" "$OUTPUT/data.win"
		mv "$OUTPUT" "$SCRIPT_DIR/utilities/android/assets"

		if [ -f "$SCRIPT_DIR/data/android/AM2R.ini" ]; then
			cp -p "$SCRIPT_DIR/data/android/AM2R.ini" "$SCRIPT_DIR/utilities/android/assets/"
		fi

		echo "Installing new datafiles..."
		cp -R "$SCRIPT_DIR"/data/files_to_copy/* "$SCRIPT_DIR/utilities/android/assets"

		if [ "$HQMUSIC" = true ]; then
			cp "$SCRIPT_DIR"/data/HDR_HQ_in-game_music/*.ogg "$SCRIPT_DIR/utilities/android/assets/"
		fi

		echo "Packaging APK..."
		echo "If Java JDK 8 or newer is not present, this will fail!"
		# decompile the apk
		java -jar "$apktoolPath" d -f "$SCRIPT_DIR/utilities/android/AM2RWrapper.apk"
		cp -R "$SCRIPT_DIR/utilities/android/assets/" "$SCRIPT_DIR/AM2RWrapper/"
		echo "Editing apktool.yml..."
	    sed -i "s/doNotCompress:/doNotCompress:\n- ogg/" "$SCRIPT_DIR/AM2RWrapper/apktool.yml"
		# build apk
		java -jar "$apktoolPath" b "$SCRIPT_DIR/AM2RWrapper" -o "$SCRIPT_DIR/AM2RWrapper.apk"
		echo "Signing APK..."
		java -jar "$uberPath" -a "$SCRIPT_DIR/AM2RWrapper.apk"
		# Cleanup
		rm -R "$SCRIPT_DIR/AM2RWrapper.apk" "$SCRIPT_DIR/utilities/android/assets/" "$SCRIPT_DIR/AM2RWrapper/"
		# Move APK
		mv "$SCRIPT_DIR/AM2RWrapper-aligned-debugSigned.apk" "$SCRIPT_DIR/AndroidM2R_"$VERSION"-signed.apk"

	else
		echo "Invalid OS \"$OSCHOICE\"! Cannot patch anything!"
		return 1
	fi

	echo ""
	echo "The operation was completed successfully. See you next mission!"
	return 0
}

# ----
# Main function starts here
# ---

echo "-------------------------------------------"
echo ""
echo "AM2R ${VERSION} Shell Autopatching Utility"
echo "Scripted by Lojemiru and Miepee"
echo ""
echo "-------------------------------------------"

if (( $# <= 0 )); then
	APPIMAGE=true
	AM2RZIP="$SCRIPT_DIR/AM2R_11.zip"
	input=""
	echo "Select your patch type:"
	echo ""
	echo "1 - Linux"
	echo "2 - Android"
	echo ""
	echo "Awaiting input:"
	read -n1 input
	echo ""
	if [ $input = "1" ]; then
		OSCHOICE="linux"
	elif [ $input = "2" ]; then
		OSCHOICE="android"
	else
		echo "Invalid OS!"
		exit 1
	fi

	echo "Install high quality in-game music? Increases filesize by 194 MB!"
	echo "[y/n]"
	read -n1 input
	echo ""
	if [ $input = "y" ]; then
		HQMUSIC=true
	fi

	echo "Do you want to install AM2R systemwide?"
	echo "[y/n]"
	read -n1 input
	echo ""
	if [ $input = "y" ]; then
		SYSTEMWIDE=true
	fi

	patch_am2r
	result=$?
	echo "Press any key to quit..."
	read -s -n1 INPUT
	exit $result
fi

while (( $# > 0 )); do
	case $1 in
	-s|--os)
		OSCHOICE="$2"
		shift 2 # past argument and value
		;;
	-m|--hqmusic)
		HQMUSIC=true
		shift # past argument
		;;
	-w|--systemwide)
		SYSTEMWIDE=true
		shift # past argument
		;;
	-a|--appimage)
		APPIMAGE=true
		shift # past argument
		;;
	-p|--prefix)
		PREFIX="$2"
		shift 2 # past argument and value
		;;
	-z|--am2rzip)
		AM2RZIP="$2"
		shift 2 # past argument and value
		;;
	-h|--help)
		echo -e "-s, --os\t\t\tThe OS to patch to. Valid are \"linux\" and \"android\"."
		echo -e "-m, --hqmusic\t\t\tIf HighQuality music should be used."
		echo -e "-w, --systemwide\t\tIf Linux should get installed systemwide."
		echo -e "-a, --appimage\t\t\tIf an AppImage should get generated."
		echo -e "-p, --prefix\t\t\tThe prefix used for patching operations. Default for systemwide is \"/usr/local\" and for non-systemwide the folder where this script resides."
		echo -e "-z, --am2rzip\t\t\tThe path to the AM2R_11 zip or directory. Default is <directory where the script resides>/AM2R_11.zip"
		exit 0
		;;
	-*|--*)
		echo "Unknown option $1"
		exit 1
		;;
	*)
		POSITIONAL_ARGS+=("$1") # save positional arg
		shift # past argument
		;;
	esac
done
set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# check if necessary variables are provided
if [ -z "$OSCHOICE" ]; then
	echo "Missing argument! The OS needs to be provided! For further info use --help."
	exit 1
fi
if [ -z "$AM2RZIP" ]; then
	AM2RZIP="$SCRIPT_DIR/AM2R_11.zip"
fi

patch_am2r
exit $?
