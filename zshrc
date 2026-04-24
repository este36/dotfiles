export EDITOR=vim

if command -v brew &> /dev/null; then
    export PATH="$(brew --prefix)/bin:$PATH"
else
    export PATH="$(HOME)/local/bin:$PATH"
    export PATH="$(HOME)/dotfiles:$PATH"
    export PATH="$(HOME)/local/node/bin:$PATH"
fi

export PS1="[%n@%m %~]$ "
alias ls="ls --color"
alias ll="ls -rlaF"
alias ll="ls -raF"
#alias norm="norminette --use-gitignore --no-color"
alias github="firefox https://github.com/este36"
alias ft="firefox https://profile-v3.intra.42.fr/"
alias setup_firefox="nohup firefox >/dev/null &"

