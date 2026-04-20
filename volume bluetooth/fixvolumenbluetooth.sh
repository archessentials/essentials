#!/bin/bash
# Arch Linux KDE: Fix Missing Volume Slider + Bluetooth "No Adapter"
# archessentials april 20 2026

echo "=== 1. Install Essential Packages ==="
sudo pacman -Syu --needed pipewire pipewire-alsa pipewire-pulse wireplumber plasma-pa bluez bluez-utils bluedevil linux-firmware

echo "=== 2. Enable & Start Services ==="
sudo systemctl enable --now bluetooth
systemctl --user enable --now pipewire pipewire-pulse wireplumber

echo "=== 3. Fix USB Boot Spam (device descriptor read/64, error -110) ==="
echo 'blacklist usb-storage' | sudo tee /etc/modprobe.d/no-usb-spam.conf
echo 'options usbcore default_reset_interface=1' | sudo tee /etc/modprobe.d/usb-powersave.conf

echo "=== 4. Reset Bluetooth Driver ==="
sudo modprobe -r btusb 2>/dev/null
sleep 2
sudo modprobe btusb
sudo systemctl restart bluetooth

echo "=== 5. Add KDE Volume Widget ==="
# Right-click panel → Add Widgets → "Audio Volume" → Drag to panel
# OR restart Plasma:
killall plasmashell; kstart5 plasmashell &

echo "=== 6. Regenerate Initramfs & Reboot ==="
sudo mkinitcpio -P

echo "=== REBOOT NOW ==="
echo "After reboot:"
echo "1. bluetoothctl list (should show adapter)"
echo "2. Right-click panel → Add Widgets → Audio Volume widget"
echo "3. No more USB boot spam!"

echo "Done! 🎉"
