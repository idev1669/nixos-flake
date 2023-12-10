{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    over-tlauncher       # launcher for minecraft
    spotify              # music
    #krita               # video editing currently installed via flatpak(fix needed)
    gimp                 # image editing
    over-outline-manager # outline manager vpn(proxy)
    owofetch             # fetch tool
  ];
}