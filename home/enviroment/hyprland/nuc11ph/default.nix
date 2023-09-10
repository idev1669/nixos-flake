{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./../universal.nix
  ];

  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
    settings.monitor = "HDMI-A-1,3440x1440@100,0x0,1";
  };
}