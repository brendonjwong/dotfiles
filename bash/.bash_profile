# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export VISUAL=vim
export EDITOR="$VISUAL"

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# added by Snowflake SnowSQL installer v1.0
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

export HISTCONTROL=ignoredups

# Change default prompt
# PS1="\h:\W \u\$ "
PS1="\u:\W \$ "

# startup postgresql
alias startpostgres='pg_ctl -D /usr/local/var/postgres start'

# startup django app server
alias startserver='python manage.py runserver 8000'

# startup airflow server
alias startairflow='docker-compose run -p 8080:8080 airflow_local server'

alias ll='ls -l'
alias la='ls -a'
alias gb='git branch'
alias gs='git status'
alias gc='git checkout'
alias gcm='git checkout master'
alias gd='git diff'
alias gf='git fetch'
alias gfs='git fetch && git status'
alias activate='source env/bin/activate'
alias wbp='./node_modules/.bin/webpack'
alias pipupdate='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# pyenv init
eval "$(pyenv init -)"
