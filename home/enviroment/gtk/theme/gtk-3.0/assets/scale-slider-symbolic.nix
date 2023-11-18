{config, lib, pkgs, ...}:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/assets/scalable/scale-slider-symbolic.svg".text = ''
<svg width="24" height="24" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
 <defs>
  <linearGradient id="a" x2="24" gradientUnits="userSpaceOnUse">
   <stop stop-color="#1A73E8" offset="1"/>
  </linearGradient>
 </defs>
 <g id="scale-slider">
  <rect width="24" height="24" fill="none"/>
  <circle cx="12" cy="12" r="6"/>
 </g>
</svg>
  '';
}