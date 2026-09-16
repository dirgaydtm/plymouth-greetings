# Plymouth Greetings 🎨
A dynamic Plymouth boot splash theme featuring a welcoming "Hello" animation during boot and a "Goodbye" animation during shutdown.

![Plymouth](https://img.shields.io/badge/Plymouth-Theme-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Linux](https://img.shields.io/badge/OS-Linux-orange)


## Preview

**Booting ("Hello")**
<img src="assets/hello/hello.png" alt="Boot Preview" width="420">

**Shutdown ("Goodbye")**
<img src="assets/goodbye/goodbye.png" alt="Shutdown Preview" width="420">


## Features

- **Auto Mode Detection:** Automatically detects and plays the appropriate animation based on the event (booting or shutdown).
- **Smooth Animation:** Seamless frame transitions with support for ping-pong looping effects.
- **Responsive Scaling:** Intelligently scales the animation to fit the screen resolution using `BOX_SCALE`.
- **Easy Installation:** Automated installation script that handles `initramfs` rebuilding (supports both dracut & update-initramfs).


## Prerequisites

Ensure the following dependencies are installed on your system before proceeding:
- `plymouth` (Required)
- `dracut` or `initramfs-tools` (For rebuilding initramfs)
- `sudo` privileges


## Installation

Installation is straightforward. Simply clone this repository and run the installation script.

```bash
# 1. Clone the repository
git clone https://github.com/dvsalmah/plymouth-greetings.git

# 2. Navigate to the directory
cd plymouth-greetings

# 3. Run the installation script (requires sudo)
chmod +x install.sh
./install.sh
```

The script will automatically copy the theme to `/usr/share/plymouth/themes/`, set it as the default theme, and rebuild your `initramfs`.


## Configuration / Customization

You can easily adjust the animation speed and hold duration to your liking. Open the `/usr/share/plymouth/themes/plymouth-greetings/theme.script` file and modify the following variables:

```javascript
// Frame transition speed (Higher is faster)
HELLO_STEP = 0.10;
GOODBYE_STEP = 0.06;

// How many frames the animation pauses on the last frame before reversing
HOLD_LIMIT = 12;

// Screen scaling (0.30 means the animation takes up 30% of the screen height/width)
BOX_SCALE = 0.30;
```
*Note: After making any changes to the `.script` file, you **must** run `sudo dracut -f` (Fedora/RHEL) or `sudo update-initramfs -u` (Debian/Ubuntu) to apply the changes.*


## Uninstallation

If you wish to remove this theme and revert to your default one (e.g., `bgrt`), run the following commands:

```bash
# Revert to the default theme (replace 'bgrt' with your OS default)
sudo plymouth-set-default-theme -R bgrt

# Remove the greetings theme folder
sudo rm -rf /usr/share/plymouth/themes/plymouth-greetings
```


## Credits & License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.