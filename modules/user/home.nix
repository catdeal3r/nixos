{ inputs, ... }:

{
  modules = [
    inputs.home-manager.nixosModules.default
  ];

}
