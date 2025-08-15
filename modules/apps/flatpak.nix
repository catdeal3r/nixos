{ inputs, ... }:

{
  imports = [
    inputs.flatpaks.nixosModule
  ];

  {
  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/io.gitlab.theevilskeleton.Upscaler//stable"
    ];
  };
}
}
