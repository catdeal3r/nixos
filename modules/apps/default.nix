{ pkgs, ... }:

{

  imports = [
    ./quickshell.nix
    ./flatpak.nix
  ];
  
  environment.systemPackages = with pkgs; [
    vim
    wget
    tmux
    git
    gh
    fastfetch
    tree
    fish
    flatpak
    krita
    gimp
    opentabletdriver
    mpv
    ffmpeg
    zoxide
    yazi
    tldr
    cbonsai
    playerctl
    firefox
    udisks
    geany
    feh
    cava
    mlocate
    gvfs
    libgcc
    gnat15
    raylib
    libGL
    vlc
    htop
    vscodium
    libreoffice
    ungoogled-chromium
    libinput
    gnome-text-editor
    unzip
    gnome-extension-manager
    commit-mono
    orchis-theme
    stow
    helix  
    pkg-config
    jq
    power-profiles-daemon
    gparted
    pandoc
    texliveTeTeX
    fox
    tty-clock
    waybar
    imagemagick
    ueberzugpp
    clipman
    python313
    python313Packages.pip
    viewnior
    ghidra
    gdb
    glow
    gnome-boxes
    dnsmasq
    equibop
    xsel
    ngrok
    php
    openvpn
    lunar-client
    prismlauncher
    gnome-calculator
    sherlock-launcher
    proxychains
    fuse3
  ];
  
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  virtualisation.libvirtd = {
    enable = true;

    # Enable TPM emulation (for Windows 11)
    qemu = {
      swtpm.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
  };

  users.groups.libvirtd.members = [ "catdealer" ];
  users.groups.kvm.members = [ "catdealer" ];
}
