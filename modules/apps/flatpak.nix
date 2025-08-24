{ inputs, lib, ... }:

{
  imports = [
    inputs.flatpak-nix.nixosModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;

    remotes = lib.mkOptionDefault [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];

    update.onActivation = true;

    packages = [
      "io.gitlab.theevilskeleton.Upscaler"
    ];
  };
}
