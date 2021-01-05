# Fedora 33 on MacBook Pro 14,1

##
Yeah, I have a MacBook Pro....and?

These are a couple of tings that I have found that made my life easier.

## Desktop Tweaks

```
# Set fractional DPI for Wayland
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"

# Disable Typing when using the mouse pad
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
```

### Root commands:

#### Install with full-disk encryption

If you are installing with full-disk encryption, you will need to run the following in the live-ISO _before_ you reboot. To do so:
1. Open up a terminal
1. Run `chroot /mnt/sysroot`
1. Run the commands
1. Reboot

#### The Commands

Simply run:
```
git clone github.com/darkmuggle/fedora-mbp-14.1
cd fedora-mbp-14.1
make add
make install
```

## A Note

The real work comes from the fine folks at:
https://github.com/Dunedan/mbp-2016-linux
https://github.com/patjak/bcwc_pcie/

A lot of Googling...this repo is my collection of what works for me.
