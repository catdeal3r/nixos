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
      "io.github.equicord.equibop"
      "md.obsidian.Obsidian"
    ];
    
    overrides = {
      global.Environment.XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
    };
  };
}
