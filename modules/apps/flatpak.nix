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
      "md.obsidian.Obsidian"
      "com.transmissionbt.Transmission"
      "com.usebottles.bottles"
    ];
    
    overrides = {
      global = {
        Context.sockets = [ "wayland" "org.freedesktop.Notifications" "!x11" "!fallback" ];      

        Environment = {
          # Fix un-themed cursor in some Wayland apps
          XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

          # Force correct theme for some GTK apps
          GTK_THEME = "Adwaita:dark";
        };
      };

      "io.github.equicord.equibop".Context = {
        filesystems = [
          "/home/catdealer/" # Expose user directory and data drive
          "/run/media/catdealer/Data/"
        ];
      };
     
      "md.obsidian.Obsidian".Context.filesystems = [
        # fix monke cursor
        "/nix/store:ro"
      ];
    };
  };
}
