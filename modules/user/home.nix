{ inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  home-manager.users.catdealer = { pkgs, ... }: {
    useUserPackages = true;
    useGlobalPkgs = true;    

    gtk = {
      enable = true;
      cursorTheme = {
        name = "GoogleDot-Black";
        package = pkgs.google-cursor; 
      };
    };
   
    home.stateVersion = "25.05";
  };
}
