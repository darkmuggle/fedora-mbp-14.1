#!/bin/bash
echo LID0 > /proc/acpi/wakeup
echo XHC1 > /proc/acpi/wakeup
/bin/echo 0 > /sys/bus/pci/devices/0000\:01\:00.0/d3cold_allowed
