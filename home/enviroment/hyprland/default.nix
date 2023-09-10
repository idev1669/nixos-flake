{ config, lib, pkgs, deflocale, uservars, hostname, ... }:
let
  usersettings = import (./. + "/usersettings/${uservars.description}.nix");
in
{
  imports = [ 
    (./. + "/hostsettings/${hostname}.nix")
    (./. + "/usersettings/${uservars.description}.nix")
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(ff0084cc) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(f7add3cc)";
        layout = "dwindle";
        
      };
      decoration = {
        rounding = 5;
      };
      #bezier = "ease,0.4,0.02,0.21,1";
      #  animation = "windows, 1, 3.5, ease, slide";
      #  animation = "windowsOut, 1, 3.5, ease, slide";
      #  animation = "border, 1, 6, default";
      #  animation = "fade, 1, 3, ease";
      #  animation = "workspaces, 1, 3.5, ease";
      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        
      };
      input = {
        kb_layout = "${deflocale.kblayout}";
        kb_variant = "${deflocale.kbvariant}";
        kb_options = "${deflocale.kboption}";
        follow_mouse = 1;
        touchpad = {
            natural_scroll = true;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
      misc = {
        disable_hyprland_logo = false;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_is_master = true;
      };
    };
    extraConfig =''

  # Fix slow startup
    #exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    #exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

    exec-once = hyprctl setcursor Bibata-Modern-Classic 24
    #exec-once = dunst
    exec-once = waybar

    source = /home/${uservars.name}/.config/hypr/colors
#    exec = pkill waybar & sleep 0.5 && waybar
#    exec-once = swww init
#    exec = swww img /home/${uservars.name}/Imagens/wallpapers/menhera.jpg


#------------------screen sharing------------------
exec-once = xwaylandvideobridge
windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
windowrulev2 = noanim,class:^(xwaylandvideobridge)$
windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
#------------------screen sharing------------------

${usersettings.extraConfig}

    '';
  };
  home.file.".config/hypr/colors".text = ''
$background = rgba(1d192bee)
$foreground = rgba(c3dde7ee)

$color0 = rgba(1d192bee)
$color1 = rgba(465EA7ee)
$color2 = rgba(5A89B6ee)
$color3 = rgba(6296CAee)
$color4 = rgba(73B3D4ee)
$color5 = rgba(7BC7DDee)
$color6 = rgba(9CB4E3ee)
$color7 = rgba(c3dde7ee)
$color8 = rgba(889aa1ee)
$color9 = rgba(465EA7ee)
$color10 = rgba(5A89B6ee)
$color11 = rgba(6296CAee)
$color12 = rgba(73B3D4ee)
$color13 = rgba(7BC7DDee)
$color14 = rgba(9CB4E3ee)
$color15 = rgba(c3dde7ee)
  '';
}