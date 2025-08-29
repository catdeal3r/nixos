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
      global.Environment.XCURSOR_PATH = "/home/catdealer/.icons:/home/catdealer/.local/share/icons:/home/catdealer/.local/share/flatpak/exports/share/icons:/home/catdealer/.local/share/flatpak/exports/share/pixmaps:/var/lib/flatpak/exports/share/icons:/var/lib/flatpak/exports/share/pixmaps:/home/catdealer/.nix-profile/share/icons:/home/catdealer/.nix-profile/share/pixmaps:/nix/profile/share/icons:/nix/profile/share/pixmaps:/home/catdealer/.local/state/nix/profile/share/icons:/home/catdealer/.local/state/nix/profile/share/pixmaps:/etc/profiles/per-user/catdealer/share/icons:/etc/profiles/per-user/catdealer/share/pixmaps:/nix/var/nix/profiles/default/share/icons:/nix/var/nix/profiles/default/share/pixmaps:/run/current-system/sw/share/icons:/run/current-system/sw/share/pixmaps";

      "io.github.equicord.equibop".Context = {
      filesystems = [
        "/home/catdealer/" # Expose user directory
      ];
    };
  };
}
