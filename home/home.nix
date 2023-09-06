{ hyprland, config, lib, pkgs, curversion, uservars, ... }:
{
  imports = [
    ./programs
    ./../scripts
  ];
  home = {
    stateVersion = "${curversion}";
    username = "${uservars.name}";
    homeDirectory = "/home/${uservars.name}";
  };

  home.packages = (with pkgs; [
    #screenshots
    grim
    slurp

    #sound
    pamixer
    pavucontrol

    #vm and virt
    virt-manager
    distrobox
    docker
    docker-compose
    egl-wayland

    #web
    curl
    wget
    wireshark
    nm-tray

    #vid photo sound etc
    krita
    spotify
    ffmpeg
    vlc
    mpc-cli
    pamixer
    nomacs
    gnome.eog

    #chat
    telegram-desktop
    whatsapp-for-linux

    #utils
    partition-manager
    qbittorrent
    pciutils
    usbutils
    lshw
    file
    gnome.nautilus
    rustdesk
    btop
    neofetch
    git
    gh
    github-desktop
    iwd
    zip
    unzip

    #security
    openssl
    veracrypt
    

    #hw related
    bluez
    mesa
    mesa-demos

    #games
    steam
    #(lutris.override {
    #  extraLibraries =  pkgs: [
    #    giflib
    #    libpng
    #    gnutls
    #    mpg123
    #    openal
    #    v4l-utils
    #    libpulseaudio
    #    libgpg-error
    #    alsa-lib
    #    libjpeg
    #    xorg.libXcomposite
    #    xorg.libXinerama
    #    libgcrypt
    #    gst_all_1.gst-plugins-base
    #    vulkan-loader
    #  ];
    #  extraPkgs = pkgs: [
    #    alsa-plugins
    #    gtk3
    #    sqlite
    #    winePackages.staging
    #  ];
    #})

    #other
    openjdk19

    #temp
    git
    kitty
    wofi
  ]);
}
