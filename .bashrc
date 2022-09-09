######## finally, the custom lines ########

# pretty prompt
PROMPT_COMMAND=__prompt_command
__prompt_command() {

  local EXIT="$?"
  PS1=""

  local Clear='\[\e[0m\]'
  local Bold='\[\e[1m\]'
  local BlackFG='\[\e[30m\]'
  local BlackBG='\[\e[40m\]'
  local RedFG='\[\e[31m\]'
  local RedBG='\[\e[41m\]'
  local GreenFG='\[\e[32m\]'
  local GreenBG='\[\e[42m\]'
  local MagentaFG='\[\e[35m\]'
  local MagentaBG='\[\e[45m\]'
  local CyanFG='\[\e[36m\]'
  local CyanBG='\[\e[46m\]'
  local WhiteFG='\[\e[37m\]'
  local WhiteBG='\[\e[47m\]'
  local GrayFG='\[\e[90m\]'
  local GrayBG='\[\e[100m\]'
  local BYellowFG='\[\e[93m\]'
  local BYellowBG='\[\e[103m\]'
  local BWhiteFG='\[\e[97m\]'
  local BWhiteBG='\[\e[107m\]'

  if [ $TERM == "linux" ]
  then
    # I don't have Powerline patched fonts for Linux tty
    # e.g. "[eric@eric-debian ~]$ "
    PS1="${debian_chroot:+($debian_chroot)}\[\e[2;97m\]\[\e[1;100m\][\[\e[m\]\[\e[1;100m\]\[\e[1;93m\]\u@\h\[\e[1;90m\] \[\e[2;36m\]\W\[\e[2;97m\]]\[\e[m\]\[\e[1;90m\]$\[\e[m\] "
  else
    # return status of previous command
    if [ $EXIT != 0 ]
    then
      PS1+="$Clear$WhiteFG$RedBG $(printf '%3s' $EXIT) $Clear"
      PS1+="$RedFG$GrayBG"
    else
      PS1+="$Clear$BlackFG$GreenBG $(printf '%3s' $EXIT) $Clear"
      PS1+="$GreenFG$GrayBG"
    fi

    # user and machine name
    # PS1+="$Bold$GrayBG$BYellowFG \u@\h $Clear$BlackFG$GrayBG"
    PS1+="$Bold$GrayBG$BYellowFG \u@\h $Clear$GrayFG$CyanBG"

    # working directory
    # PS1+="$Bold$CyanFG$GrayBG \W $Clear$GrayFG $Clear"
    PS1+="$Bold$GrayFG$CyanBG \W "

    # branch (if in git repository)
    if git rev-parse --git-dir 2> /dev/null > /dev/null ;
    then
      local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
      PS1+="$CyanFG$MagentaBG$BlackFG  $branch $Clear$MagentaFG $Clear"
    else
      PS1+="$Clear$CyanFG $Clear"
    fi

    PS2="$GrayBG ... $Clear$GrayFG $Clear"

    # PS1+="${debian_chroot:+($debian_chroot)}\[\e[2;97m\]\[\e[1;100m\]\t\[\e[2;97m\] \[\e[2;97m\] \[\e[1;100m\]\[\e[m\]\[\e[1;100m\]\[\e[1;93m\]\u@\h\[\e[2;97m\]  \[\e[2;36m\]\W\[\e[2;97m\] \[\e[m\]\[\e[1;90m\]\[\e[m\] "
  fi
}

# set Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"
export SUDO_EITOR="$EDITOR"

# fix tmux colors in tty3, etc.
alias tmux='tmux -2'

# disable bell in Xorg
if [ -n "$DISPLAY" ]; then
  xset b off
fi

# update gpg-agent
export GPG_TTY=$(tty)

# comment here because I'm going to forget this command soon:
# keybase ctl stop

# I'm also going to forget this soon
# gsettings set org.gnome.desktop.wm.preferences workspace-names "['first workspace name', 'second workspace name', 'third workspace name']"

# here's a workaround to prevent laptop from continually waking
# immediately after suspending, by disallowing USB to wake:
# sudo su
# echo XHC > /proc/acpi/wakeup

# if bluetooth headphones have terrible quality, change to A2DP in
# settings

# uh, panel clock keeps on resetting, but here's my preferred time
# format string:
# %A, %b %e, %Y / %H:%M

# turn off x screensaver
# xset s off
# xset s noblank
# (xset q) for help

# custom scripts
export PATH="/home/eric/scripts:$PATH"

# Kazam recordings need post-processing before most applications will
# view them (although VLC seems to work fine)
# ffmpeg -i in.mp4 -pix_fmt yuv420p -c:a copy -movflags +faststart out.mp4

# color for manpages, taken from serverfault
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# I forget this frequently enough that is worth it
alias pdfmerge='gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=out.pdf'
alias rasterize='convert -density 300 -antialias'

alias sml='rlwrap sml'
alias ocaml='rlwrap ocaml'
. "$HOME/.cargo/env"
eval $(opam config env)
