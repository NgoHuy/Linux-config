autoload -U compinit promptinit colors 
compinit
promptinit
colors

# set completion style
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*' menu select
#zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# This will set the default prompt to the walters theme
#prompt walters

# search binary when not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# set ignored dumps
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# setup key accordingly
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

# set correct command
setopt correctall

# Set $PATH
export PATH=$PATH

# Set alias 
alias ls='ls --color=auto'
alias grep="grep --color"

# Set timestamp
export TIMEFMT="Command finished in $fg[red]real$reset_color %E $fg[red]user$reset_color %U $fg[red]sys$reset_color %S $fg[red]cpu$reset_color %P"
export REPORTTIME

# set prompt
#PS1="%{$fg[green]%}You're%{$reset_color%} %{$fg[red]%}%n%{$reset_color%} %{$fg[green]%}AT%{$reset_color%} %{$fg[red]%}%M%{$reset_color%} %{$fg[blue]%}%c%{$reset_color%} \n $: "
precmd() { print -rP "%{$fg[green]%}You're%{$reset_color%} %{$fg[red]%}%n%{$reset_color%} %{$fg[green]%}AT%{$reset_color%} %{$fg[red]%}%M%{$reset_color%} %{$fg[blue]%}%c%{$reset_color%}" }
export PS1="$: "
