{ inputs, lib, ... }:

{
  imports = [
    inputs.flatpak-nix.nixosModule.nix-flatpak
  ];

  services.flatpak = {
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
