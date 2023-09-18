{ inputs, config, lib, pkgs, deflocale, uservars, hostname, tempvar, brightnesctrl, ... }:
{
  imports = [ 
    (./. + "/hostsettings/${hostname}.nix")
    (./. + "/usersettings/${uservars.description}.nix")
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.x86_64-linux.hyprland;
    systemdIntegration = true;
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(${config.colorScheme.colors.base0C}) rgb(${config.colorScheme.colors.base0B}) 45deg";
        "col.inactive_border" = "rgb(${config.colorScheme.colors.base01})";
        layout = "dwindle";
      };
      decoration = {
        rounding = 5;
      };
      animations = {
        enabled = true;
        bezier = "ease,0.4,0.02,0.21,1";
        animation = [
          "windows, 1, 3.5, ease, slide"
          "windowsOut, 1, 3.5, ease, slide"
          "border, 1, 6, default"
          "fade, 1, 3, ease"
          "workspaces, 1, 3.5, ease"
        ];
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
    extraConfig = ''
exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland

    exec-once = hyprctl setcursor Bibata-Modern-Classic 24
    #exec-once = dunst

#----------------------bar------------------------
exec-once = ${config.home.homeDirectory}/.scripts/ewwlauncher.sh
#exec-once = eww daemon
#exec-once=eww open popup-power-window --config ${tempvar}/ewwmy/
#exec-once=eww open bar-test --config ${tempvar}/ewwmy/
exec-once=nm-applet #network manager
#------------------------------------------------- 

exec-once = ln -sf /var/lib/flatpak/exports/share/applications/* ${config.home.homeDirectory}/.local/share/applications/
exec-once = ln -sf ln -sf /etc/profiles/per-user/${uservars.name}/share/applications/* ${config.home.homeDirectory}/.local/share/applications/
    source = ${config.home.homeDirectory}/.config/hypr/colors
#    exec-once = swww init
#    exec = swww img ${config.home.homeDirectory}/Imagens/wallpapers/menhera.jpg


windowrule=float,^(pavucontrol)$

windowrule=float,^(blueman-manager)$

windowrule=size 934 525,^(mpv)$
windowrule=float,^(mpv)$
windowrule=center,^(mpv)$

#------------------kitty for btop------------------
windowrule=float,^(kitty)$
windowrule=center,^(kitty)$
windowrule=size 1040 670,^(kitty)$
#--------------------------------------------------

#------------------screen sharing------------------
exec-once = xwaylandvideobridge
windowrulev2 = opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
windowrulev2 = noanim,class:^(xwaylandvideobridge)$
windowrulev2 = nofocus,class:^(xwaylandvideobridge)$
windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
#--------------------------------------------------
    
#------------------functional keys-----------------
bind =,XF86AudioMicMute,exec,pamixer --default-source -t
bind =,XF86MonBrightnessDown,exec,${brightnesctrl.down}
bind =,XF86MonBrightnessUp,exec,${brightnesctrl.up}
bind =,XF86AudioMute,exec,pamixer -t
bind =,XF86AudioLowerVolume,exec,pamixer -d 10
bind =,XF86AudioRaiseVolume,exec,pamixer -i 10
bind =,XF86AudioPlay,exec,playerctl play-pause
bind =,XF86AudioPause,exec,playerctl play-pause
#--------------------------------------------------
    '';
  };
  home.file.".config/hypr/colors".text = ''
$background = rgb(${config.colorScheme.colors.base01})
$foreground = rgb(${config.colorScheme.colors.base06})

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
