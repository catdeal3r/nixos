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
      global.Environment.XCURSOR_PATH = "/home/catdealer/.icons";

      "io.github.equicord.equibop".Context = {
        filesystems = [
          "/home/catdealer/" # Expose user directory and data drive
          "/run/media/catdealer/Data/"
        ];
      };
     
      "md.obsidian.Obsidian".Context.filesystems = [
        "/home/catdealer/.icons/" # fix monke cursor?
        "/nix/store:ro"
      ];
    };
  };
}
