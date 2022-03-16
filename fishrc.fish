#!/usr/bin/fish

# Part of my shell config ($HOME/.config/myshell)

# fish aliases
set fishrc ~/.config/myshell/fishrc.fish # this file
set fish_functions ~/.config/myshell/fish_functions.fish
set fish_config ~/.config/fish/config.fish # main config fish
set awesome_config ~/.config/awesome/rc.lua
set shortcuts ~/.config/awesome/myshortcuts.lua
set theme ~/.config/awesome/themes/moonlight/theme.lua
set kak_config ~/.config/kak/kakrc
# set qtile_config ~/.config/qtile/config.py
set alacritty_config ~/.config/alacritty/alacritty.yml
set wezterm_config ~/.config/wezterm/wezterm.lua
set starship_config ~/.config/starship.toml
set kitty_config ~/.config/kitty/kitty.conf
set songs_dir /mnt/krishna/All_Songs

# setting up PATHS
set PATH $PATH $HOME/.config/myshell/scripts/
set PATH $PATH $HOME/.local/bin/
set PATH $PATH $HOME/.local/bin/waterfox/
set PATH $PATH $HOME/.cargo/bin

if test ! -z "(command -v bat)"
    # set bat as manpager
    set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -Ux MANROFFOPT "-c"
end

set -Ux LS_COLORS "ow=01;34"
set -Ux TESSDATA_PREFIX /usr/share/tessdata/
set EDITOR /usr/bin/kak

# system commands
alias ls='exa'
alias pac='pacman'
alias cp='cp -r'
alias mv='mv -v'
alias t='touch'
alias s='sensors'
alias l='ls'
# alias upgrade='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -R'
alias kl='killall'

# languages
alias p='python3'
alias pi='python3 -i'
alias dj='p manage.py'

# text editor aliases
alias k='kak'
alias m='micro'
alias lite='~/.local/bin/lite/lite'
alias dlth='rm -rf $HOME/.cache/thumbnails/'

# cd aliases
alias cdsc='cd $dsc ; cf'
alias cdc='cd $dc ; cf'
alias cdrs='cd $drs ; cf'
alias cdpy='cd $dpy ; cf'
alias cdsel='cd $dsel ; cf'
alias cdgpy='cd $dgpy ; cf'
alias cddj='cd $ddj ; cf'
alias cdre='cd $dre ; cf'
alias cdv='cd $dv ; cf'
alias cdne='cd $dne ; cf'
alias cdcs='cd $dcs ; cf'
alias cdex='cd /mnt/extras ; cf'
alias cdp='cd $dp ; cf'
alias cdpl='cd $dpl ; cf'
alias cdg='cd $dg ; cf'
alias cdxco='cd $dxco ; cf'
alias cfg='cd ~/.config/ ; cf'
alias cdwall='cd $dwall ; cf'
alias cdtemp='cd $dp/temp ; cf'
alias clipboard='xsel --input --clipboard'

# others
alias v='vnstat'
alias vh='vnstat -hg'
alias vd='vnstat -d'
alias yes='echo "yes"'
alias no='echo "no"'
alias cvpn='windscribe connect gb && notify-send "VPN Connected"'
alias dvpn='windscribe disconnect && notify-send "VPN Disconnected"'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

## abbreviations
abbr -a -g ga git add
abbr -a -g gc git commit -m
abbr -a -g gp git push origin
abbr -a -g gpm git push origin master
abbr -a -g gpd git push origin develop
abbr -a -g gpl git pull
abbr -a -g gs git status
abbr -a -g gst git stash
abbr -a -g gsw git switch
abbr -a -g gd git diff

abbr -a -g pl perl
abbr -a -g pac pacman
abbr -a -g ins install
abbr -a -g cr cargo run
abbr -a -g md mid3v2
abbr -a -g se sudoedit

abbr -a -g r runserver

abbr -a -g upg upgrade
abbr -a -g ins sudo pacman -S
abbr -a -g rem sudo pacman -R

## variables
# cfg=~/.config
set dsc /mnt/extras/Scripts
set dc /mnt/projects/C
set dpy /mnt/projects/Python
set drs /mnt/projects/Rust
set dsel /mnt/projects/Selenium
set dgpy /mnt/projects/Pygame
set dp /mnt/projects
set dpl /mnt/projects/Perl
set ddj /mnt/projects/Django
set dne /mnt/projects/Next
set dre /mnt/projects/React
set dv /mnt/projects/Vue
set dwall /mnt/extras/Wallpapers
set dg /mnt/projects/Git
set dxco /mnt/extras/config

# sourcing
if test -f "$HOME/.config/myshell/fish_functions.fish"
    source "$HOME/.config/myshell/fish_functions.fish"
end

if test -f "$HOME/.config/myshell/projects_aliases.fish"
    source "$HOME/.config/myshell/projects_aliases.fish"
end

if test -f "$HOME/.config/myshell/secrets.fish"
    source "$HOME/.config/myshell/secrets.fish"
end

if test ! -z "(command -v starship)"
    starship init fish | source
end

# fm6000 -c bright_cyan -v -n -f ~/.config/myshell/astronaut.txt -g 4
fm6000 -c random -r -v
