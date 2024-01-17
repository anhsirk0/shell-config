set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.rbenv/bin/
set PATH $PATH $HOME/.local/share/gem/ruby/3.2.0/bin
export BUNDLE_PATH=~/.gems

set -Ux LS_COLORS "ow=01;34"
set -Ux CHROME_EXECUTABLE "/usr/bin/brave"
set -Ux TESSDATA_PREFIX /usr/share/tessdata/

# others
set -g awesome_config ~/.config/awesome/rc.lua
set -g shortcuts ~/.config/awesome/keys/keys.lua
set -g theme ~/.config/awesome/theme.lua
set -g kak_config ~/.config/kak/kakrc
# set qtile_config ~/.config/qtile/config.py
set -g alacritty_config ~/.config/alacritty/alacritty.yml
set -g wezterm_config ~/.config/wezterm/wezterm.lua
set -g starship_config ~/.config/starship.toml
set -g kitty_config ~/.config/kitty/kitty.conf
set -g songs_dir /mnt/krishna/All_Songs

abbr -a -g upg upgrade
abbr -a -g eo eopkg
abbr -a -g eos eopkg search
abbr -a -g ins sudo eopkg it
abbr -a -g rem sudo eopkg rm

alias upgrade='sudo eopkg upgrade'

# languages
alias p='python3'
alias pi='python3 -i'

alias s='sensors'
alias dj='p manage.py'
alias pix='pix 2> /dev/null'

# alias v='vnstat'
# alias vh='vnstat -hg'
# alias vd='vnstat -d'
alias yes='echo "yes"'
alias no='echo "no"'
# alias cvpn='windscribe connect gb && notify-send "VPN Connected"'
alias dvpn='windscribe disconnect && notify-send "VPN Disconnected"'

alias k='kak'
alias dlth='rm -rf $HOME/.cache/thumbnails/'
alias clipboard='xsel --input --clipboard'

function cvpn
    windscribe connect $argv && notify-send "VPN Connected"
end

## abbreviations
abbr -a -g pl perl
abbr -a -g md mid3v2
abbr -a -g se sudoedit
abbr -a -g r runserver

abbr -a -g wi windscribe login
abbr -a -g wo windscribe logout
abbr -a -g wa windscribe account

# if test -n "$(command -v bat)"
#     # set bat as manpager
#     set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
#     # set -Ux MANPAGER "sh -c 'col -bx | kak'"
#     set -Ux MANROFFOPT "-c"
# end

function e
    nohup emacsclient -c -a "emacs" $argv[1] </dev/null &>/dev/null &
end

function enw
    emacsclient -nw $argv
end

function sl
    if test "." = "$argv[1]"
        set -U sloc (pwd) && echo "Saved current loction as '\$sloc'"
    else
        cd $sloc ; cf $argv[1]
    end
end

function update-bat-theme
    if test -n "$(grep Light ~/.config/gtk-3.0/settings.ini -m 1)"
        set THEME OneHalfDark
    else
        set THEME OneHalfLight
    end
    sed -i "s/^--theme=.*/--theme=$THEME/" (bat --config-file)
    echo "Bat theme updated to: $THEME"
end

# function upgrade
#     sudo pacman -Sy                           # update datbase
#     if pacman -Qu archlinux-keyring           # check if keyring needs update
#         sudo pacman -S archlinux-keyring      # update keyring
#     end
#     sudo pacman -Su                           # update the whole system
# end

function precmd --on-event fish_prompt
    echo ""
end

# fm6000 -rd "$HOME/.config/myshell/ascii_arts" -v -c "random"
fm6000 -f "$HOME/.config/myshell/ascii_arts/solus.txt" -v -c "random"
