{ config
, ...
}:
{
  home.file.".config/neofetch/config.conf".text = ''
print_info() {
    prin "┌─────────\n Hardware Information \n─────────┐"
    info " ​ ​ 󰌢 " model
    info " ​ ​ 󰍛 " cpu
    info " ​ ​ 󰘚 " gpu
    info " ​ ​  " disk
    info " ​ ​ 󰑭" memory
    info " ​ ​ 󰍹 " resolution
#    info " ​ ​ 󱈑 " battery 
    prin "├─────────\n Software Information \n─────────┤"
    info " ​ ​  " users
    info " ​ ​  " distro
    info " ​ ​  " kernel
    info " ​ ​  " de
    info " ​ ​  " wm
    info " ​ ​  " shell
    info " ​ ​  " term
    info " ​ ​  " term_font
    info " ​ ​ │  " font
    info " ​ ​  󰉼 " theme
    info " ​ ​  󰀻 " icons
    info " ​ ​ 󰊠 " packages 
    info " ​ ​  󰅐 " uptime
    info " ​ ​   " gpu_driver
    info " ​ ​  " cpu_usage
    prin "└───────────────────────────────────────┘"
    info cols
prin "\n \n \n \n \n ''${cl3} \n \n ''${cl5} \n \n ''${cl2} \n \n ''${cl6}  \n \n ''${cl4}  \n \n ''${cl1}  \n \n ''${cl7}  \n \n ''${cl0}"
}

kernel_shorthand="on"
distro_shorthand="off"
os_arch="off"
uptime_shorthand="on"
memory_percent="off"
package_managers="on"
shell_path="off"
shell_version="on"
speed_type="bios_limit"
speed_shorthand="on"
cpu_brand="off"
cpu_speed="off"
cpu_cores="logical"
cpu_temp="off"
gpu_brand="off"
gpu_type="all"
refresh_rate="on"
gtk_shorthand="on"
gtk2="on"
gtk3="on"
disk_show=('/')
colors=(distro)
bold="on"
underline_enabled="on"
underline_char="-"
separator="  "
color_blocks="off"
block_range=(0 15) # Colorblocks

magenta="\033[1;35m"
green="\033[1;32m"
white="\033[1;37m"
blue="\033[1;34m"
red="\033[1;31m"
black="\033[1;40;30m"
yellow="\033[1;33m"
cyan="\033[1;36m"
reset="\033[0m"
bgyellow="\033[1;43;33m"
bgwhite="\033[1;47;37m"
cl0="''${reset}"
cl1="''${magenta}"
cl2="''${green}"
cl3="''${white}"
cl4="''${blue}"
cl5="''${red}"
cl6="''${yellow}"
cl7="''${cyan}"
cl8="''${black}"
cl9="''${bgyellow}"
cl10="''${bgwhite}"

block_width=4
block_height=1

bar_char_elapsed="-"
bar_char_total="="
bar_border="on"
bar_length=15
bar_color_elapsed="distro"
bar_color_total="distro"

cpu_display="on"
memory_display="on"
battery_display="on"
disk_display="on"

image_backend="ascii"
image_size="auto"
image_loop="off"

aascii_distro="auto"
ascii_colors=(distro)
ascii_bold="on"

gap=2

yoffset=0
xoffset=0

stdout="off"

  '';
}