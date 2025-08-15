{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager.users.catdealer = { pkgs, ... }: {
    gtk = {
      enable = true;
      cursorTheme = {
        name = "GoogleDot-Black";
        package = pkgs.google-cursor; 
      };
    };
  };
}
