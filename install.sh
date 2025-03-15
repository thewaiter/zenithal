#!/bin/bash
# A simple script to install all the build artifacts into one location

if [ ! -v E_HOME_DIR ]; then 
    E_HOME_DIR=$HOME/.e/e
fi

THEME_NAME=MokshaZenithal

echo "Building theme"
cd zenithal
./build.sh
cd ..

echo "Installing theme"
mkdir -p "$E_HOME_DIR/themes/"
cp "$THEME_NAME.edj" "$E_HOME_DIR/themes/"
mkdir -p "$HOME/.elementary/themes"
cp "$THEME_NAME.edj" "$HOME/.elementary/themes"
mkdir -p "$HOME/.local/share/icons"
cp -r "Delft" "$HOME/.local/share/icons"
cp -r "Delft-Gray" "$HOME/.local/share/icons"
if which update-icon-caches >/dev/null 2>&1 ; then
   update-icon-caches /"$HOME/.local/share/icons/Delft"
   update-icon-caches /"$HOME/.local/share/icons/Delft-Gray"
fi

mkdir -p "$HOME/.themes/"
cp -r "$THEME_NAME-GTK" "$HOME/.themes/$THEME_NAME"

echo "Theme installed"
