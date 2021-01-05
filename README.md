# Fedora 33 on MacBook Pro 14,1

Fedora 33 _mostly_ works on a MacBook Pro 14,1 (seriously, there's a comma in the version).

Out of the box, _sort_ of works. But things get a bit flaky without some tweaks. For example:
- Wifi is flaky (you need a karg tweak)
- Without tweaks, your MacBook doesn't go to sleep, it goes comatose.
- Those with a privacy focus will be pleased to know that Facetime HD camera is pretty much unusable.
- Sound needs a KMOD.

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

## She's a Sleeping Beauty

Without tweaks, the sleek Macbook Pro running Linux will be a sleeping beauty. The root cause is that the NVME disk powers down; the device defaults require that you turn on cold-plugging. In the scripts https://github.com/darkmuggle/fedora-mbp-14.1/blob/patronus/files/fixsleep.sh#L2 allows her to wake up, but she's a bit groggy (give her a good 10-20 seconds).

I recommend disabling automatic suspend when the lid is closed by setting the following in `/etc/systemd/login.conf`:
```
HandleLidSwitch=ignore
LidSwitchIgnoreInhibited=yes
```
and then reboot.

### Root commands:

#### Install with full-disk encryption

If you are installing with full-disk encryption, you will need to run the following in the live-ISO _before_ you reboot. To do so:
1. Connect to wifi
1. Open up a terminal
1. Run `chroot /mnt/sysroot`
1. Run the commands below.
1. Reboot

#### The Commands

Simply run:
```
git clone github.com/darkmuggle/fedora-mbp-14.1 fmbp
cd fmbp
make add
make install
```

## A Note

The real work comes from the fine folks at:

- https://github.com/Dunedan/mbp-2016-linux
- https://github.com/patjak/bcwc_pcie/
- https://github.com/davidjo/snd_hda_macbookpro

I found this through the tried-and-true method of Googling...this repo is my collection of what works for my MBP.
