{ config
, pkgs
, desk
, cpuvar
, uservars
, ...
}:
{
  home.file.".config/eww/eww.yuck".text = 
  let
    battery = if desk == "laptop" then "(battery)" else "";
    proxy = if uservars.proxy then "(proxy)" else "";
    cputemp = if cpuvar == "intel" then ''
(box 
  :class "cputemp"
  "''${EWW_TEMPS.CORETEMP_CORE_0}°C "
)
(box :class "spacerh" "|")
    '' else '''';
  in
  ''
(defvar deftimeout "999999999ms")
(defpoll datetime :interval "1s" "date '+%a, %d. %b  %H:%M'")
(defvar proxystatus "󰱟")
(defvar soundvol "xx")
(defvar wss "xxx")
(defvar langvar "tt")
(defvar showpowerbuttons false)
(defvar showcalendar false)
(defvar songname "None")
(defvar songunfolded false)
(defvar songfolded true)
(defvar defaultscreen 0)
(defvar recsym "")
(defvar recclass "replay inactive")

(defwidget calendarpop []
  (eventbox 
    :onhover ""
    :onhoverlost "''${EWW_CMD} update showcalendar=false"
    (box
		:space-evenly false  
    (revealer
      :transition "slideup"
      :reveal showcalendar
      :duration "1000ms"
      (box 
        :class "calelndarpop"
        :orientation "v"
        ;;:space-evenly false
        (calendar 
          :class "calelndarpop"
          :day {formattime(EWW_TIME, "%d")}
          :month {formattime(EWW_TIME, "%m")}
          :year {formattime(EWW_TIME, "%Y")}
        )
      )
    )"")
  )
)

(defwidget powerbuttons []
  (eventbox 
    :onhover ""
    :onhoverlost "''${EWW_CMD} update showpowerbuttons=false"
    (box
      :space-evenly false  
    (revealer
      :transition "slideup"
      :reveal showpowerbuttons
      :duration "500ms"
      (box
        :class "powerpopup"
        :halign "start" 
        :spacing 3
        :orientation "vertical"
        (button
          :class "suspend" 
          :onclick "${pkgs.systemd}/bin/systemctl suspend"
          ""
        )
        (button 
          :class "reboot"
          :onclick "${pkgs.systemd}/bin/reboot"
          ""
        )
        (button 
          :class "shutdown"
          :onclick "${pkgs.systemd}/bin/shutdown -h now"
          "󰐥"
        )
      )
    )"")
  )
)

(defwindow popup-power-window
  :monitor 0
  :stacking "overlay"
  :exclusive false
  :geometry (geometry 
    :x "0.25%"
    :y "0%"
    :anchor "top right")
  (powerbuttons)
)

(defwindow calendar-popup-window
  :monitor 0
  :stacking "overlay"
  :exclusive false
  :geometry (geometry 
    :x "0.25%"
    :y "0.5%"
    :anchor "center top")
  (calendarpop)
)

(defwindow bar
  :monitor 0
  :stacking "fg"
  :class "bar1"
  :exclusive true
  :geometry (geometry 
    :y "0.5%"
    :width "99.5%"
    :height "30"
    :anchor "top center")
  (bar-widget)
    
)
(defwidget bar-widget []
  (centerbox 
    :orientation "h"
    :class "bar1"
    (left)
    (center)
    (right)
  )
)
(defwidget left []
  (box 
    :orientation "h" 
		:space-evenly false  
    :halign "start"
    :spacing 6
    (launcher)
    (lang)
    (usageinfo)
    (workspaces)
  )
)
(defwidget center []
  (box 
    :orientation "h"
    :space-evenly false
    :halign "center"
    (clock)
  )
)
(defwidget right []
  (box 
    :orientation "h" 
		:space-evenly false
    :spacing 6
    :halign "end"
    ${proxy}
    (music)
    (replay)
    (box 
      :orientation "h"
      :class "tray"
      (systray
        :space-evenly true
        :spacing 6
      )
    )
    (sound)
    (microphone)
    ${battery}
    (power)
  )
)

(defwidget replay []
  (box
    :orientation "h"
    (button 
      :class recclass
      :onclick "${pkgs.bash}/bin/bash ~/.scripts/play-pause.sh"
      :onrightclick "${pkgs.bash}/bin/bash ~/.scripts/play-pause.sh 0"
      (box 
        recsym
      )
    )
  )
)

  (defwidget music []
    (box
      :orientation "h"
      :space-evenly false
      :class "music-controls"
      (button
        :timeout "300ms"
        :onclick "${pkgs.playerctl}/bin/playerctl previous"
        :class "previoussong"
        (box 
          :class "symb"
          "󰙤"
        )
      )
      (button
        :timeout "300ms"
        :class "playpause"
        :onclick "${pkgs.playerctl}/bin/playerctl play-pause"
        (box 
          :class "symb"
          "󰐎"
        )
      )
      (button
        :timeout "300ms"
        :onclick "${pkgs.playerctl}/bin/playerctl next"
        :class "nextsong"
        (box 
          :class "symb"
          "󰙢"
        )
      )
      (box :class "spacerh" "|")
      (eventbox 
        :onclick "''${EWW_CMD} update songfolded=''${songfolded? false : true} && ''${EWW_CMD} update songunfolded=''${songunfolded? false : true}"
        (box
		      :space-evenly false  
          (revealer
            :transition "slideleft"
            :reveal songfolded
            :duration "1000ms"
            (box
              :class "songbtn"
              "󰫔"
            )
          )
          ""
        )
      )
      (eventbox 
        :onclick "''${EWW_CMD} update songunfolded=''${songunfolded? false : true} && ''${EWW_CMD} update songfolded=''${songfolded? false : true}"
        (box
		      :space-evenly false  
          (revealer
            :transition "slideright"
            :reveal songunfolded
            :duration "1000ms"
            (box
              :class "songname"
              "''${songname}"
            )
          )
          ""
        )
      )
    )
  )

(defwidget proxy []
    (box
      :orientation "h"
      (button 
        :class "proxy"
        :timeout "''${deftimeout}"
        :onclick "${pkgs.bash}/bin/bash ~/.scripts/ss.sh"
        (box 
          "''${proxystatus}"
        )
      )
    )
  )

(defwidget power []
  (box
    :orientation "h"
    (button 
      :class "minipower"
      :onclick "''${EWW_CMD} update showpowerbuttons=true"
      (box 
        "󰐥"
      )
    )
  )
)

(defwidget battery []
  (box 
    :orientation "h"
    (button
      :class "battery"
      :onclick ""
      (box
        "''${EWW_BATTERY.BAT0.capacity}%"
      )
    )
  )
)

(defwidget microphone []
  (box
    :orientation "h"
    (button 
      :class "mic"
      :onclick "${pkgs.bash}/bin/bash ~/.scripts/microphone.sh"
      (box 
        "󰍬"
      )
    )
  )
)

(defwidget lang []
  (box 
    :orientation "h"
    :space-evenly false
    :class "lang"
    (box 
      :class "langsymb"
      "󰇧"
    )
    (box 
      :class "langvar"
      "''${langvar}"
    )
  )
)

(defwidget sound []
    (box
      :orientation "h"
      (button 
        :class "sound"
        :timeout "''${deftimeout}"
        :onclick "${pkgs.pavucontrol}/bin/pavucontrol"
        (box 
          (box 
            :class "soundsymb"
            "󰕾"
          )
          (box 
            :class "soundvol"
            "''${soundvol}"
          )
        )
      )
    )
)

(defwidget clock []
  (box
    :orientation "h"
    (button 
      :class "miniclock" 
      :timeout "''${deftimeout}"
      :onclick "''${EWW_CMD} update showcalendar=true"
      (box
        datetime
      )
    )
  )
)

(defwidget workspaces []
  (box 
    :orientation "horizontal"
    :hexpand false
    :vexpand false
    :class "workspaces"
    wss
  )
)  

(defwidget usageinfo []
  (box
    :orientation "h"
    (button 
      :class "usageinfo"
      :timeout "''${ deftimeout}"
      :onclick "${pkgs.kitty}/bin/kitty ${pkgs.btop}/bin/btop"
      (box 
        :space-evenly false
        :spacing 10
        :halign "start"
        (box 
          :class "ram"
          "''${round(EWW_RAM.used_mem/1073741824,1)}/''${round(EWW_RAM.total_mem/1073741824,1)} Gb "
        )
        (box :class "spacerh" "|")
        ${cputemp}
        (box 
          :class "disk"
          "''${round(EWW_DISK['/'].free/1073741824,1)} Gb "
        )
        (box :class "spacerh" "|")
        (box 
          :class "boot"
          "''${round(EWW_DISK['/boot'].free/1073741824,1)} Gb"
        )
      )
    )
  )
)

(defwidget launcher []
  (box
    :orientation "h"
    (button 
      :class "launcher"
      :timeout "''${deftimeout}"
      :onclick "${config.programs.rofi.finalPackage}/bin/rofi -show"
      (box
        " "
      )
    )
  )
)

  '';
}