#!/bin/bash
THEME_NAME="plymouth-greetings"
TARGET_DIR="/usr/share/plymouth/themes/$THEME_NAME"

echo "Installing Plymouth theme $THEME_NAME..."

sudo rm -rf "$TARGET_DIR"
sudo mkdir -p "$TARGET_DIR"

sudo cp *.png "$TARGET_DIR/" 2>/dev/null
sudo cp theme.script "$TARGET_DIR/"

if [ -f theme.plymouth ]; then
    sudo cp theme.plymouth "$TARGET_DIR/$THEME_NAME.plymouth"
elif [ -f "$THEME_NAME.plymouth" ]; then
    sudo cp "$THEME_NAME.plymouth" "$TARGET_DIR/$THEME_NAME.plymouth"
fi

sudo sed -i "s|ScriptFile=.*|ScriptFile=$TARGET_DIR/theme.script|" "$TARGET_DIR/$THEME_NAME.plymouth"
sudo sed -i "s|ImageDir=.*|ImageDir=$TARGET_DIR|" "$TARGET_DIR/$THEME_NAME.plymouth"

sudo chmod 755 "$TARGET_DIR"
sudo chmod 644 "$TARGET_DIR"/*

sudo plymouth-set-default-theme -R "$THEME_NAME"

if command -v dracut >/dev/null 2>&1; then
    echo "Rebuilding initramfs with dracut..."
    sudo dracut -f
elif command -v update-initramfs >/dev/null 2>&1; then
    echo "Rebuilding initramfs with update-initramfs..."
    sudo update-initramfs -u
else
    echo "No initramfs rebuild tool found; skipping rebuild."
fi

echo "Done! Theme installed properly."