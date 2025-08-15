{ inputs, ... }:

{
  environment.systemPackages = [ inputs.quickshell.packages.x86_64-linux.default ];
}
