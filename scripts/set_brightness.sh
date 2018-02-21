brightness=$1
max_brightness=$(cat /sys/class/backlight/acpi_video0/max_brightness)
if  (( brightness > max_brightness )); then
    brightness=$max_brightness
fi

echo "$brightness" > /sys/class/backlight/acpi_video0/brightness
