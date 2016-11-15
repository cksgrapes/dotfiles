#Read ~/.bashrc
. ~/.bashrc

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
