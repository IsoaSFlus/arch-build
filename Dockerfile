FROM archlinux:latest
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN date
RUN echo "[archlinuxcn]" >> /etc/pacman.conf
RUN echo 'Server = https://mirrors.ocf.berkeley.edu/archlinuxcn/$arch' >> /etc/pacman.conf
RUN pacman-key --init
RUN pacman -Sy archlinux-keyring --noconfirm
RUN pacman -Syu base-devel git  --noconfirm && sed -i '/E_ROOT/d' /usr/bin/makepkg
RUN pacman -S archlinuxcn-keyring --noconfirm
RUN pacman -S yay --noconfirm
COPY entrypoint.sh /entrypoint.sh
COPY pkgs /inner-pkgs
ENTRYPOINT ["/entrypoint.sh"]
