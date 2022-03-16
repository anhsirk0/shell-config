## functions for fish

function upgrade
    sudo pacman -Sy                           # update datbase
    if pacman -Qu archlinux-keyring           # check if keyring needs update
        sudo pacman -S archlinux-keyring      # update keyring
    end
    sudo pacman -Su                           # update the whole system
end

function lls
    set n (ls | wc -l)
    test $n -lt 100 && ls || echo $n" Files"
end

function cf
    set dir (pwd)
    set goto false
    set any false
    for i in $argv
        if test "$i" = "-g"
            set goto true
        else if test "$i" = "-f"
            set any true
        else
            if $any
                # set dir $dir/(ls -p $dir | grep '/' | grep -ie "$i" -m 1)
                set dir $dir/(exa --only-dirs $dir | grep -ie "$i" -m 1)
            else
                # set dir $dir/(ls -p $dir | grep '/' | grep -ie "^$i" -m 1)
                set dir $dir/(exa --only-dirs $dir | grep -ie "^$i" -m 1)
            end
        end
    end

    cd $dir

    if $goto
        goto
    end
    # list files
    lls
end

function ..
    if test -z $argv[1]
        set n 1
    else
        set n $argv[1]
    end
    for i in (seq $n)
        cd ..
    end
    lls
end

function sl
    if test "." = "$argv[1]"
        set -U sloc (pwd) && echo "Saved current loction as '\$sloc'"
    else
        cd $sloc ; cf $argv[1]
    end
end

function mkcd
    mkdir $argv[1] -p
    if test -d "$argv[1]"
        cd $argv[1]
    end
end

function lu
    set s ""
    for arg in $argv
        if test "$arg" = "-t"
            set s $s "| tail"
        else if test "$arg" = "-h"
            set s $s "| head"
        else
            set s "| grep -i" $arg $s
        end
    end

    set s "history" $s
    eval $s
end

function kok
    for i in brave nemo vlc pix java chromium
        killall $i
    end
end

function goto
    cd (fd -d 3 -t d | fzf)
end

# create react components
# single file coponent
function sfrc
    for arg in $argv
        set component "$arg.js"
        touch $component
        echo "const $arg = () => {" >> $component
        echo "  return (" >> $component
        echo "  );" >> $component
        echo "};" >> $component
        echo "" >> $component
        echo "export default $arg;" >> $component
    end
end

# exported component 
function crc
    for arg in $argv
        set component "./$arg/$arg"
        mkdir $arg && touch "$component.js"
        echo "export { default as $arg } from \"$component\";" >> index.js
        cd $arg && sfrc $arg && cd ..
    end
end

# # sql queries
# function query
#     if test -f $argv[1]
#         cat $argv[1] | sqlite3 $argv[2]
#     else
#         echo $argv[1] | sqlite3 $argv[2]
#     end
# end

function set_gap
    if ! test -z $argv[1]
        set themes (fd -g "theme.lua" ~/.config/awesome/themes)
        sed -i "/gap/s/dpi(.*)/dpi($argv[1])/" $themes
    else
        echo "Gap length not provided"
    end
end

function e
    nohup emacsclient -c -a "emacs" $argv[1] </dev/null &>/dev/null &
end

