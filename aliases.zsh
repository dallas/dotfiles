# Show/Hide "hidden" files/folders in Finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'

# Hide/Show the desktop
alias hidedesktop='defaults write com.apple.finder CreateDesktop false && killall Finder'
alias showdesktop='defaults write com.apple.finder CreateDesktop true && killall Finder'

# Shell commands
alias @='pwd'
alias l='lsa'

# Zeus
alias z='zeus'
alias zeus='nocorrect zeus'

# Rails 2
alias sc='script/console'
alias sg='script/generate'
alias ss='script/server'

# Rack app logs
alias dlog='tail -f log/development.log'
alias logs='tail -f log/*.log'

# Passenger
alias rst='touch tmp/restart.txt'

# Apache
alias arst='sudo apachectl graceful'
alias slog='tail -f /private/var/log/apache2/error_log'
alias slogs='tail -f /private/var/log/apache2/*log'

# Thor
alias bthor='noglob bundle exec thor'

# Hub
# alias git=hub

# Git
# (all of the commented out ones are taken care of by the git and git-extras
# plugins for oh-my-zsh)
alias gai='git add --interactive'
alias gap='git add --patch'
# alias gba='git branch -a'
alias gbd='git branch --delete'
alias gbD='git branch -D' # forcibly delete
alias gbr='git branch'
alias gbu='git branch --set-upstream-to'
# alias gca='git commit --all --verbose'
alias gcb='git checkout -b' # creates a new branch and switched to it
alias gci='git commit --verbose'
# alias gco='git checkout'
# alias gcp='git cherry-pick'
alias gdf='git diff'
alias gfh='git fetch --verbose --prune'
# alias glg='git log'
alias gmg='git merge'
alias gmv='git mv'
# alias gpl='git pull'
# alias gpr='git pull --rebase'
alias gps='git push'
alias gpu='git push --set-upstream'
alias gra='git remote add'
alias grb='git rebase --verbose'
alias grm='git rm'
alias grp='git remote prune'
alias grt='git remote'
alias gsa='git stash apply'
alias gsb='git submodule'
alias gsd='git stash drop'
alias gsh='git stash --include-untracked'
alias gsi='git submodule update --init'
alias gsl='git stash list'
alias gsp='git stash pop'
# alias gst='git status'
alias gsu='git submodule update'
alias gtg='git tag'
# alias gup='git fetch && git rebase'

# Git-SVN
alias sbr='git svn branch'
alias sci='git commit -v'
alias scl='git svn clone'
alias sco='git checkout'
alias sfh='git svn fetch'
alias slg='git svn log'
alias smg='git merge git-svn'
alias sps='git svn dcommit'
alias srb='git svn rebase'

# Misc.
alias cuke='bundle exec cucumber'
alias clot='bundle exec c10t'
alias zspec='zeus rspec'

# Simple Stand-Alone HTTP Servers
#
# Python SimpleHTTPServer
# Add a port number at the end to override the default of 8000:
#   pyserv 8080
alias pyserv='python -m SimpleHTTPServer'
#
# Ruby using HTTPD
# Override the port number by passing in a 2nd -p option:
#   rbserv -p 8080
alias rbserv='ruby -run -e httpd . -p 8000'

# TMUX and pairing
alias pairnick='ssh -R 3004:localhost:3000 -L 3004:localhost:3000 nick@cornerstone.gitnick.com'
alias nt='tmux new -s ${${PWD##*/}//./-}'

na-espec() {
  echo "rake extensions:run_specs\[$(basename `pwd`)\]"
  rake extensions:run_specs\[$(basename `pwd`)\]
}

