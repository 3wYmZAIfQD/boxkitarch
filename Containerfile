FROM docker.io/library/archlinux:base-devel

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="A cloud-native terminal experience" \
      maintainer="jorge.castro@gmail.com>"


# Install extra packages
COPY extra-packages /
RUN pacman -Syu --needed --noconfirm - < extra-packages
RUN rm /extra-packages


ARG user=makepkg
RUN useradd --system --create-home $user \
  && echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR /home/$user

RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg -sri --needed --noconfirm \
    && cd \
    # Clean up
    && rm -rf .cache yay
# Clean up cache

RUN pacman -Scc --noconfirm


#RUN   ln -fs /bin/sh /usr/bin/sh && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
#      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
#     ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree 
     
