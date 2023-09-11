{ config, lib, pkgs, envir, hostname, uservars, ... }: {
  programs.fish = {
    enable = true;
      shellAliases = {    #global aliases
        me = "echo $hostname";
        wifi = "sudo bash ~/apps/mywifi";
      };
      functions = {
        fish_greeting = {
          description = "Greeting to show when starting a fish shell";
          body = let
            commonPart = ''
switch "$hostname"
  case "${hostname}${envir}"
    alias firstinstall="bash /home/${uservars.name}/.scripts/firstinstall.sh"
    alias yay="distrobox enter --name archbox -- yay"
    alias pacman="distrobox enter --name archbox -- sudo pacman"
    #alias vscode="distrobox-enter --name archbox -- code"
    alias bpytop="distrobox-enter --name archbox -- sudo bpytop"
    alias packettracer="distrobox-enter --name archbox -- 'packettracer &'"
    alias archt="distrobox enter archbox"
    alias debt="distrobox enter debbox"
    alias vpnup="wg-quick up wg0"
    alias vpndown="wg-quick down wg0"
    alias vi="vim"
  case '*'
    # Default case
end

echo "
                      --- Welcome to $hostname fish ---

                              ░░░░▒▒
                                ▒▒░░░░
                                  ░░░░▒▒
                      ▒▒          ▒▒▒▒░░▒▒
                      ░░▒▒      ░░▒▒▒▒▒▒░░░░
                        ▒▒▒▒  ░░░░░░▒▒▒▒░░░░░░
                        ░░▒▒░░░░░░▒▒▒▒▒▒░░██░░░░
                        ░░▒▒░░░░░░▒▒▒▒▒▒░░░░░░░░
                        ▒▒▒▒  ░░░░░░▒▒▒▒░░░░░░
                      ░░▒▒      ░░▒▒▒▒▒▒░░░░
                      ▒▒          ▒▒▒▒░░▒▒
                                  ░░░░▒▒
                                ▒▒░░░░
                              ░░░░▒▒
"
        '';
            conditionalPart = if envir == "hypr" then ''

            '' else '''';
          in
          conditionalPart + commonPart;

      };
    };
  };
}
# if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
#   Hyprland
# end