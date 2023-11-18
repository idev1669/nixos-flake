{ config, lib, pkgs, uservars, ... }:
{
  imports = [
    ./assets
    ./gtk-3.0
    ./gtk-3.20
    ./gtk-4.0
    ./gnome-shell
    ./metacity-1
  ];
  home.file.".themes/dynamic-color-theme/index.theme".text = ''
[Desktop Entry]
Type=X-GNOME-Metatheme
Name=dynamic-color-theme
Comment=Viva la NixOS
Encoding=UTF-8

[X-GNOME-Metatheme]
GtkTheme=dynamic-color-theme
MetacityTheme=dynamic-color-theme
IconTheme=Adwaita
ButtonLayout=menu:minimize,maximize,close
  '';

  home.file."Documents/test.svg".text = ''<?xml version="1.0" encoding="UTF-8" standalone="no"?> <svg width="16" height="16" version="1.1" id="svg13" sodipodi:docname="titlebutton-maximize-backdrop-active.svg" inkscape:version="1.1.2 (0a00cf5339, 2022-02-04, custom)" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg"> <defs id="defs17" /> <sodipodi:namedview id="namedview15" pagecolor="#505050" bordercolor="#eeeeee" borderopacity="1" inkscape:pageshadow="0" inkscape:pageopacity="0" inkscape:pagecheckerboard="0" showgrid="false" inkscape:zoom="43.375" inkscape:cx="8" inkscape:cy="8" inkscape:window-width="1920" inkscape:window-height="1014" inkscape:window-x="0" inkscape:window-y="0" inkscape:window-maximized="1" inkscape:current-layer="svg13" /> <rect x="0" y="-1.4648437e-05" width="16" height="16" ry="1.6931001e-05" opacity="0" stroke-width="0.47432" style="paint-order:markers stroke fill" id="rect2" /> <g transform="translate(1,1)" enable-background="new" id="g8" style="fill:#9ece6a;fill-opacity:1"> <g transform="translate(-5,-1033.4)" fill-rule="evenodd" id="g6" style="fill:#9ece6a;fill-opacity:1"> <path d="m 12,1047.4 c 3.8659,0 6.9999,-3.134 6.9999,-7 0,-3.866 -3.134,-7 -6.9999,-7 -3.866,0 -7.0001,3.134 -7.0001,7 0,3.866 3.134,7 7.0001,7" fill="#4d4d4d" id="path4" style="fill:#9ece6a;fill-opacity:1" /> </g> </g> </svg>'';
}