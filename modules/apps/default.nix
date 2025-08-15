{ pkgs, ... }:

{

  imports = [
    ./quickshell.nix
    ./swayfx.nix
    ./silentSDDM.nix
#    ./flatpak.nix
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
    equibop
    mpv
    ffmpeg
    zoxide
    yazi
    tldr
    cbonsai
    playerctl
    firefox
  ];
}
