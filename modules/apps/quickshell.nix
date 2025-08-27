{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    inputs.quickshell.packages.x86_64-linux.default 
    qt6.qtimageformats
    qt6.qt5compat
    qt6.qtmultimedia
    qt6.qtdeclarative
    kdePackages.qtbase
    kdePackages.qtmultimedia
  ];

  qt.enable = true;
}
