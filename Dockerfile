FROM docker.1ms.run/debian:bookworm
RUN apt-get update

# 替换为清华大学的软件源
# RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# RUN sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install -y build-essential cmake ninja-build

RUN apt install -y libfontconfig1-dev libharfbuzz-dev libdbus-1-dev libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev libssl-dev libpng-dev libjpeg-dev libglib2.0-dev

RUN apt install -y	libgles2-mesa-dev libgbm-dev libdrm-dev

RUN apt install -y libvulkan-dev vulkan-tools libcups2-dev libwayland-dev libzstd-dev

RUN apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu

RUN apt-get install -y libasound2-dev libpulse-dev

# COPY cmake-3.24.1-linux-x86_64.sh /tmp/cmake-install.sh
# RUN chmod u+x /tmp/cmake-install.sh \
#     && mkdir /opt/cmake-3.24.1 \
#     && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.24.1 \
#     && rm /tmp/cmake-install.sh \
#     && ln -s /opt/cmake-3.24.1/bin/* /usr/local/bin
# RUN git config --global --add safe.directory /root/raspi/qt5
# RUN apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*