# Myshell config (fish)

# Installation
make sure you name it `myshell`
```bash
git clone https://codeberg.org/anhsirk0/shell-config.git ~/.config/myshell --depth 1
```
Update your fish config (~/.config/fish/config.fish)  
Add this line and you are good to go
```sh
source ~/.config/myshell/fishrc.fish
```

# Usage
This config provides a lot of useful aliases, abbreviations, functions, scripts. and few binary programs  

### Source files

It sources `fishrc`(entry point), `fish_functions`, `secrets`, `projects`, `others` (ommited .fish extension for simplicity)  
`fishrc` and `fish_functions` will always be overwritten after `update-myshell`  
Use any of `secrets`, `projects`, `others` files to add your own stuff  

### Updating
use `update-myshell` to update config
```bash
$ update-myshell
```

Files details:  
| File/Directory      | Info                                                                                                                                                                                                                                                                                            |
|---------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| fishrc.fish         | Declares aliases, abbreviations, variables, update PATH and source other files (fish_functions, secrets, projects, others)                                                                                                                                                                       |
| fish_functions.fish | Provides `..`, `cf`, `crc`, `ctc`, `e`, `gacp`, `lls`, `lu`, `mkcd`, `sfrc`, `sftc`, `sl`, `update-bat-theme`                                                                                                                                                             |
| scripts/            | Provides `area-screenshot`, `arng`, `change-audio-tags`, `dice`, `edit-file`, `ext-keyboard-kmonad`, `fm6000`, `full-screenshot`, `link-music`, `ocr`, `pere`, `run`, `runserver`, `tab-to-spaces`, `theme`, `update-myshell`, `volume`, `window-screenshot` |
|                     |                                                                                                                                                                                                                                                                                                 |

tree structure
```text
.
├── ascii_arts
│   ├── alice.txt
│   ├── arch.txt
│   ├── astronaut.txt
│   ├── dilbert.txt
│   ├── dogbert.txt
│   ├── fishes.txt
│   ├── phb.txt
│   ├── wally.txt
│   └── wolf.txt
├── bin
│   ├── lyapunov
│   ├── mosaic
│   └── primes
├── fish_functions.fish
├── fishrc.fish
├── git_abbrs.fish
├── others.fish
├── projects.fish
├── scripts
│   ├── area-screenshot
│   ├── arng
│   ├── ch
│   ├── change-audio-tags
│   ├── dice
│   ├── edit-file
│   ├── ext-keyboard-kmonad
│   ├── fm6000
│   ├── full-screenshot
│   ├── gacp
│   ├── link-music
│   ├── ocr
│   ├── pere
│   ├── run
│   ├── runserver
│   ├── tab-to-spaces
│   ├── theme
│   ├── update-myshell
│   ├── volume
│   └── window-screenshot
└── secrets.fish
```

## My projects files
#### projects.fish
```fish
set -g dp /mnt/projects
set -g dsc /mnt/extras/Scripts
set -g dc /mnt/projects/C
set -g dpy /mnt/projects/Python
set -g drs /mnt/projects/Rust
set -g dsel /mnt/projects/Selenium
set -g dgpy /mnt/projects/Pygame
set -g dpl /mnt/projects/Perl
set -g dcr /mnt/projects/Crystal
set -g dsv /mnt/projects/Svelte
set -g ddj /mnt/projects/Django
set -g dne /mnt/projects/Next
set -g dns /mnt/projects/Nest
set -g dre /mnt/projects/React
set -g dv /mnt/projects/Vue
set -g dwall /mnt/extras/Wallpapers
set -g dg /mnt/projects/Git
set -g dnotes /mnt/projects/Notes
set -g dtemp /mnt/projects/temp
set -g dxco /mnt/extras/config

# cd aliases
alias cdsc='cd $dsc ; cf'
alias cdc='cd $dc ; cf'
alias cdrs='cd $drs ; cf'
alias cdpy='cd $dpy ; cf'
alias cdsel='cd $dsel ; cf'
alias cdgpy='cd $dgpy ; cf'
alias cddj='cd $ddj ; cf'
alias cdre='cd $dre ; cf'
alias cdre='cd $dre ; cf'
alias cdv='cd $dv ; cf'
alias cdsv='cd $dsv ; cf'
alias cdne='cd $dne ; cf'
alias cdns='cd $dns ; cf'
alias cdcs='cd $dcs ; cf'
alias cdex='cd /mnt/extras ; cf'
alias cdp='cd $dp ; cf'
alias cdpl='cd $dpl ; cf'
alias cdg='cd $dg ; cf'
alias cdxco='cd $dxco ; cf'
alias cfg='cd ~/.config/ ; cf'
alias cdwall='cd $dwall ; cf'
alias cdtemp='cd $dtemp ; cf'
alias cdnotes='cd $dnotes ; cf'
alias cdcr='cd $dcr ; cf'
```

