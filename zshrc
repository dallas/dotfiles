[[ -a .zshrc_before ]] && source .zshrc_before

export CODE_HOME=$HOME/Sites
export ZSH=$HOME/.dotfiles/oh-my-zsh
export EDITOR='vim'

export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$PATH:~/Library/Android/sdk/tools
export PATH=$PATH:~/Library/Android/sdk/platform-tools

# Set up go
export GOPATH=$HOME/.go

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="agnoster"
# ZSH_THEME="dallas"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails osx git textmate ruby lighthouse)
plugins=(ruby rails osx bundler git brew npm node bower gem zsh-syntax-highlighting)
# plugins=( coffee git-extras git-remote-branch github heroku history postgres pow rbenv rake sublime themes )

source $ZSH/oh-my-zsh.sh

# Powerline path setup
export PYTHONPATH=$PYTHONPATH:~/.vim/bundle/powerline
export PATH=$PATH:~/.vim/bundle/powerline/scripts

# Wire in Powerline
powerline-daemon -q
. $HOME/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh

# Customize to your needs...
unsetopt auto_name_dirs

function c() {
  cd $CODE_HOME/$1
}

function r() {
  c $1
  gvim app/controllers/application_controller.rb
  guard -c
}

function nct() {
  c $1
  $name=${PWD##*/}
  tmux new -s $name 'vim .' -d
  tmux -t $name new-window -n 'term'
  tmux select-window -t $name:1
}

function nrt() {
  c $1
  name=${PWD##*/}
  tmux new -d -s $name -n 'vim' 'vim .'
  tmux new-window -t $name -n 'zeus' 'zsh -c zeus start'
  tmux new-window -t $name -n 'console' 'zsh -c zeus rails c'
  tmux new-window -t $name -n 'server' 'zsh -c zeus rails s'
  tmux new-window -t $name -n 'log' 'zsh -c tail -f log/development.log'
  tmux move-window -t $name -r -s 'zeus' -t 'log'
  tmux select-window -t 'vim'
  tmux attach -t $name
}

compdef '_files -W $CODE_HOME -/' c r nct nrt

# Ruby performance
# export RUBY_GC_MALLOC_LIMIT=60000000
# export RUBY_FREE_MIN=200000

# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/opt/rbenv/bin:$PATH"

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Direnv
eval "$(direnv hook zsh)"

[[ -a .zshrc_after ]] && source .zshrc_after

function $$gulp_completion() {
  compls=$(grep -Eho "gulp\.task[^,]*" gulpfile.* 2>/dev/null | sed s/\"/\'/g | cut -d "'" -f 2 | sort)
  completions=(${=compls})
  compadd -- $completions
}

compdef $$gulp_completion gulp

# Load local binaries
export PATH="$HOME/.bin:$PATH"

# Set up the CA SSL certs for OpenSSL
# export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

### Added by the Heroku Toolbelt
# Load Heroku CLI
export PATH="/usr/local/heroku/bin:$PATH"

