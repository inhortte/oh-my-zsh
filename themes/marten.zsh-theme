GREEN_BOLD=$fg_bold[green]
CYAN_BOLD=$fg_bold[cyan]
MAGENTA=$fg[magenta]
PUCE=$fg[yellow]
RED=$fg[red]
RED_BOLD=$fg_bold[red]

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~," -e "s,rummaging_round,rr," -e "s,infinite_bliss,ib,")

}
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo 'ߘ' && return
    hg root >/dev/null 2>/dev/null && echo 'ߒ' && return
    darcs whatsnew >/dev/null 2>/dev/null && echo 'ߥ' && return
    echo 'ߜ'
}

PROMPT='%{$MAGENTA%}%n%{$reset_color%}@%{$PUCE%}%m%{$reset_color%} [ %{$RED_BOLD%}$(collapse_pwd)%{$reset_color%} ]
$(prompt_char) '

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$YELLOW%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$YELLOW%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

function ls() {
    command ls $@ -Fs --color=tty
}

alias boob='print -P %s%b'
