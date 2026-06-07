#!/sbin/sh

FB="/dev/graphics/fb0"
FB1="/dev/graphics/fb1"
BL="/sys/devices/backlight.14/backlight/aml-bl/brightness"

mkdir -p /dev/graphics


# Ensure fb nodes
if [ ! -e /dev/graphics/fb0 ] && [ -f /sys/class/graphics/fb0/dev ]; then
    DEV=$(cat /sys/class/graphics/fb0/dev)
    MAJOR=${DEV%:*}
    MINOR=${DEV#*:}
    mknod /dev/graphics/fb0 c "$MAJOR" "$MINOR"
    chmod 0666 /dev/graphics/fb0
fi

if [ ! -e /dev/graphics/fb1 ] && [ -f /sys/class/graphics/fb1/dev ]; then
    DEV=$(cat /sys/class/graphics/fb1/dev)
    MAJOR=${DEV%:*}
    MINOR=${DEV#*:}
    mknod /dev/graphics/fb1 c "$MAJOR" "$MINOR"
    chmod 0666 /dev/graphics/fb1
fi

if [ ! -e /dev/fb0 ]; then
    ln -s /dev/graphics/fb0 /dev/fb0
fi



# Hide boot logo layer, usually osd1/fb1
echo 1 > /sys/class/graphics/fb1/blank 2>/dev/null
dd if=/dev/zero of="$FB1" bs=4096 count=1 2>/dev/null

# Enable fb0/osd0
echo 0 > /sys/class/graphics/fb0/blank 2>/dev/null


# Match stock recovery scaling:
# source fb0 area: 1920x1080
echo "0 0 1919 1079" > /sys/class/graphics/fb0/free_scale_axis 2>/dev/null

# destination physical/output area: 3840x2160
echo "0 0 3839 2160" > /sys/class/graphics/fb0/window_axis 2>/dev/null

# stock recovery reports scale_axis = 0 0 0 0
echo "0 0 0 0" > /sys/class/graphics/fb0/scale_axis 2>/dev/null

# stock recovery reports free_scale_enable:[0x10001]
echo 0x10001 > /sys/class/graphics/fb0/free_scale 2>/dev/null

# Clear framebuffer memory to remove stale logo/noise.
# stock dmesg shows fb memory size=24576K.
dd if=/dev/zero of="$FB0" bs=1024 count=24576 2>/dev/null

# Keep backlight on
echo 255 > "$BL" 2>/dev/null
