LIBDEPS="libfontconfig1-dev libfreetype6-dev libx11-dev libx11-xcb-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev\
    libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev libxcb-util-dev\
    libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev\
    libdrm-dev libdrm-etnaviv1 libdrm-freedreno1 libdrm-tegra0 libgl-dev libglx-dev mesa-common-dev\
    libegl-dev libegl1-mesa-dev libgbm-dev libgles-dev libgles2-mesa-dev libglvnd-dev libopengl-dev libopengl0 libvulkan-dev mesa-vulkan-drivers\
    libxcb-cursor-dev libxcursor-dev\
    libssl-dev libjpeg-dev"

sudo apt update
sudo dpkg --add-architecture armhf

# Install 64-bit libraries
sudo apt install  $LIBDEPS

# Install 32-bit libraries
sudo apt install crossbuild-essential-armhf
echo $LIBDEPS | sed -E -e 's/ +|$/:armhf /g' | xargs sudo apt install