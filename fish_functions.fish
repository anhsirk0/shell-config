## functions for fish

# Goto sub directory via fzf
function goto-dir
    if test -n "$(command -v fd)"
        set -l dir (fd -d 3 -t d | fzf)
    else
        set -l dir \
            (find -maxdepth 3 -type d -not -path '*/.*' -not -path '.' | \
            sed 's,^./,,g' | fzf --tac)
    end
    test -z "$dir" && cd $dir
end

# cd into subdirs via fuzzy matching
# Example: `cf dow mu` will
#           cd into Download/Music or Down/Must or whatever matches first (^)
#         `cf -f dow mu` will
#           cd into abcDownload/Music or whatever matches first
#         -g flag can be added to run `goto-dir` after cf
function cf
    set dir (cd-fuzzy $argv)
    test -d "$dir" && cd $dir && ls
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
    ls
end

function mkcd
    mkdir $argv[1] -p
    if test -d "$argv[1]"
        cd $argv[1]
    end
end
