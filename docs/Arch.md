## Arch linux installation & configuration guide

### WiFi setup
```
iwctl
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect *SSID*
```

### Disk management
```
fdisk -l /dev/sdx
cfdisk /dev/sdx
mkfs.fat -F32 /dev/sdx1 # 512M EFI partition
mkfs.ext4 /dev/sdx2 # Root partition
mount /dev/sdx2 /mnt
```

### Basic system configuration
```
pacstrap -i /mnt base linux linux-firmware sudo nvim
genfstab -U -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
# Edit /etc/locale.gen and uncomment "en_US.UTF-8"
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Kyiv /etc/localtime
echo *hostname* > /etc/hostname
# Add basic hosts config to /etc/hosts:
# 127.0.0.1 localhost
# ::1       localhost

passwd
pacman -S networkmanager grub efibootmgr
systemctl enable NetworkManager
mkdir /boot/efi
mount /dev/sdx1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
reboot
```

### Initial login & further configuration
```
useradd -m -g users -G wheel -s /bin/bash *username*
passwd *username*
EDITOR=nvim visudo # Uncomment %wheel ALL=(ALL:ALL) ALL
exit
nmtui
sudo pacman -S base-devel xorg xorg-init xorg-server pulseaudio pulseaudio-alsa
```
Exra packages to install
<details>
  <summary>Packages to install with pacman</summary>
  acpi
  alacritty
  alsa-utils
  base-devel
  brightnessctl
  catfish
  ctop
  dunst
  feh
  git
  grub
  grub-customizer
  gvfs
  htop
  i3-wm
  i3blocks
  i3lock
  i3status
  neovim
  network-manager-applet
  noto-fonts-emoji
  pavucontrol
  picom
  polkit
  pulseaudio
  pulseaudio-alsa
  rofi
  stow
  thunar
  thunar-archive-plugin
  thunar-media-tags-plugin
  thunar-volman
  tmux
  ttf-ubuntu-mono-nerd
  tumbler
  xkblayout-state-git
  xorg
  xorg-init
  xorg-server
  xsel
  yay
  zsh
</details>
<details>
  <summary>Packages to install with yay</summary>
  rhythmbox
  google-chrome
  telegram-desktop
</details>

### Restoring dotfiles
```
zsh
# install OMZ

git clone https://github.com/onedevlad/dotfiles.git .dotfiles
cd .dotfiles
make
```

### Manual GRUB entry for Windows 11
```
insmod part_gpt
insmod chain
set root=(hd0,gpt1)
chainloader /EFI/Microsoft/Boot/bootmgfw.efi
boot
```

### libinput touchpad configuration
> /etc/X11/xorg.conf.d/30-touchpad.conf
```
Section "InputClass"
	Identifier "touchpad"
	Driver "libinput"
	Option "NaturalScrolling" "on"
	Option "Tapping" "on"
	Option "TappingButtonMap" "lrm"
	Option "ClickMethod" "clickfinger"
	Option "Accel Speed" "0.25"
EndSection
```

### polkit rule allowing %wheel% users to mount partitions
> /etc/polkit-1/rules.d/10-udisks2.rules
```
// Allow udisks2 to mount devices without authentication
// for users in the "wheel" group.
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
```
