# Arch Linux KDE Fix: Volume + Bluetooth + Boot Spam

One-command fix for fresh Arch Linux KDE installs missing:
- Volume slider/widget
- Bluetooth "No Adapter" error 

## What It Does
- Installs PipeWire + plasma-pa + Bluetooth stack  
- Adds missing KDE volume widget controls  
- Fixes Bluetooth driver + USB timeouts  
- Silences boot USB enumeration spam  
- Works with Jabra/NVIDIA/Ryzen audio hardware  

## Usage

```bash
# From ~/Downloads
cd ~/Downloads && chmod +x fixvolumenbluetooth.sh && ./fixvolumenbluetooth.sh
```

Script auto-reboots. After reboot:
1. Right-click panel → Add Widgets → "Audio Volume" → Drag to panel
2. `bluetoothctl list` shows your adapter
3. Clean boot, no spam!

## What's Fixed

| Problem | Fix |
|---------|-----|
| No volume slider | `plasma-pa` + widget instructions |
| Bluetooth "no adapter" | `btusb` driver + `linux-firmware` |
| Boot USB spam | `usbcore` + `blacklist usb-storage` |
| PipeWire audio | Full PipeWire stack + services |

## Script Source
[fixvolumenbluetooth.sh](./fixvolumenbluetooth.sh)

## Author
archessentials

## License
MIT - Use anywhere!
