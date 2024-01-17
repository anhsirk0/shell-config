#!/usr/bin/fish

# Part of my shell config ($HOME/.config/myshell)

# fish aliases
set myshellrc ~/.config/myshell/fishrc.fish # this file
set myshell_functions ~/.config/myshell/fish_functions.fish
set myshell_others ~/.config/myshell/others.fish
set myshell_projects ~/.config/myshell/projects.fish
set myshell_dir ~/.config/myshell
set fish_config ~/.config/fish/config.fish # main config fish

# setting up PATHS
set fish_complete_path $fish_complete_path $HOME/.config/myshell/completions
set PATH $PATH $HOME/.config/myshell/scripts/
set PATH $PATH $HOME/.config/myshell/bin/
set PATH $PATH $HOME/.local/bin/

set -Ux fish_color_autosuggestion brwhite
set -Ux fish_color_command brcyan
set -Ux fish_color_comment yellow
set -Ux fish_color_cwd green
set -Ux fish_color_cwd_root red
set -Ux fish_color_end magenta
set -Ux fish_color_error red
set -Ux fish_color_escape cyan
set -Ux fish_color_history_current --bold
set -Ux fish_color_host normal
set -Ux fish_color_host_remote yellow
set -Ux fish_color_match brblue
set -Ux fish_color_normal normal
set -Ux fish_color_operator brblue
set -Ux fish_color_param white
set -Ux fish_color_quote yellow
set -Ux fish_color_redirection brwhite
set -Ux fish_color_search_match 'bryellow'  '--background=brblack'
set -Ux fish_color_selection 'white'  '--bold'  '--background=brblack'
set -Ux fish_color_status red
set -Ux fish_color_user brgreen

# system commands
if test -n "$(command -v eza)"
    alias ls='eza'
end

alias cp='cp -r'
alias mv='mv -v'
alias t='touch'
alias l='ls'
alias kl='killall'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias bell='echo -n \a'

# sourcing files
function source_my_files
    for arg in $argv
        set arg (printf $arg | sed 's/.fish$//')
        set file "$HOME/.config/myshell/$arg.fish"
	    test -f $file && source $file
    end
end

# use `others.fish` to override this file
source_my_files "fish_functions" "secrets" "projects" "others" "git_abbrs"

# if starship prompt is installed
if test -n "$(command -v starship)"
    starship init fish | source
end
