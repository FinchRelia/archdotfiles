# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/.local/bin
# Don't overwrite history
shopt -s histappend
HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT="%d/%m/%y %T "

# Prompt
PS1='\[\e[31m\][\[\e[1;33m\]\u\[\e[32m\]@\[\e[34m\]\h\[\e[35m\] \[\e[0;95m\]\W\[\e[0;31m\]]\[\e[0m\]$\[\e[m\] \[\e0'

# Load aliases
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# Colored man
man(){
    LESS_TERMCAP_md=$'\e[01;31m'\
    LESS_TERMCAP_me=$'\e[0m'\
    LESS_TERMCAP_se=$'\e[0m'\
    LESS_TERMCAP_so=$'\e[01;44;33m'\
    LESS_TERMCAP_ue=$'\e[0m'\
    LESS_TERMCAP_us=$'\e[01;32m'\
    command man "$@"
}


# Softwares
export EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export RANGER_LOAD_DEFAULT_RC="false"

# Dotnet
export PATH=$PATH:~/.dotnet/tools

# Perl
PATH="/home/syrell/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/syrell/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/syrell/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/syrell/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/syrell/perl5"; export PERL_MM_OPT;

# Pyenv
eval "$(pyenv init -)"
# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Ctrl+w delete only one word
stty werase undef
bind '\C-w:unix-filename-rubout'

# Pass bash completion
source /usr/share/bash-completion/completions/pass
