{ config, lib, pkgs, uservars, brightnesctrl, envir, ... }:
{

  home.file.".config/swhkd/env-controls".text = let 
    killactive = if envir=="hypr" then "hyprctl dispatch killactive"
      else if envir == "sway" then "swaymsg kill"
      else "";
    togglesplit = if envir=="hypr" then "hyprctl dispatch togglesplit"
      else if envir == "sway" then "swaymsg layout toggle split"
      else "echo 'no envir'";
    togglefloating = if envir=="hypr" then "hyprctl dispatch togglefloating"
      else if envir == "sway" then "swaymsg floating toggle"
      else "";
    pseudo = if envir=="hypr" then "hyprctl dispatch pseudo"
      else if envir == "sway" then "swaymsg pseudo"
      else "";
    nextworkspace = if envir=="hypr" then "hyprctl dispatch workspace e+1 && bash ${config.home.homeDirectory}/.scripts/eww_ws.sh"
      else if envir == "sway" then "swaymsg workspace next"
      else "";
    prevworkspace = if envir=="hypr" then "hyprctl dispatch workspace e-1 && bash ${config.home.homeDirectory}/.scripts/eww_ws.sh"
      else if envir == "sway" then "swaymsg workspace prev"
      else "";
    movenextworkspace = if envir=="hypr" then "hyprctl dispatch movetoworkspace e+1 && bash ${config.home.homeDirectory}/.scripts/eww_ws.sh"
      else if envir == "sway" then "swaymsg move container to workspace next"
      else "";
    moveprevworkspace = if envir=="hypr" then "hyprctl dispatch movetoworkspace e-1 && bash ${config.home.homeDirectory}/.scripts/eww_ws.sh"
      else if envir == "sway" then "swaymsg move container to workspace prev"
      else "";
    fullscreen = if envir=="hypr" then "hyprctl dispatch fullscreen"
      else if envir == "sway" then "swaymsg fullscreen toggle"
      else "";
    nextactivewindow = if envir=="hypr" then "hyprctl dispatch cyclenext"
      else if envir == "sway" then "swaymsg focus next"
      else "";
    movetoworkspace = if envir=="hypr" then "bash -c 'hyprctl dispatch movetoworkspace \"$@\" && ${config.home.homeDirectory}/.scripts/eww_ws.sh' -- "
      else if envir == "sway" then "swaymsg move container to workspace"
      else "";
    workspace = if envir=="hypr" then "bash -c 'hyprctl dispatch workspace \"$@\" && ${config.home.homeDirectory}/.scripts/eww_ws.sh' -- "
      else if envir == "sway" then "swaymsg workspace"
      else "";
  in ''

super + shift + q
  ${killactive}

super + s
  ${togglesplit}

super + f
  ${togglefloating}

super + g
  ${fullscreen}

super + p
  ${pseudo}

super + tab
  ${nextactivewindow}

ctrl + right
  ${nextworkspace}

ctrl + left
  ${prevworkspace}

super + {1-9, 0}
  ${workspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10} 

ctrl + shift + right
  ${movenextworkspace}

ctrl + shift + left
  ${moveprevworkspace}

ctrl + shift + {1-9, 0}
  ${movetoworkspace} {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
  '';
}