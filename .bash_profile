export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#ALIASSES
alias ls='ls -GFh'
alias ll='ls -la'

#docker
alias cleardc='docker container rm -f $(docker container ls -aq)'
alias cleardi='docker rmi $(docker images -q)'

#login
alias kib='kinit jvanheijst@BOLCOM.NET'

#kubernetes
alias kdes='kubectl describe'
alias kg='kubectl get'
alias kdel='kubectl delete'
alias klogs='kubectl logs -c stg-sentry-app'

#some useful
alias grep='grep --color=auto'
alias h='history'
alias hg='history | grep'
alias j='jobs -l'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias ping='ping -c 5'
alias header='curl -I'
alias kill8080='kill -kill `lsof -t -i tcp:8080`'
alias feclean='rm yarn.lock && rm -rf node_modules/ && rm package-lock.json'
alias npm_scripts='cat package.json | jq -r ".scripts"'
alias cdrnwy='cd ~/projects/wsp-rnwy-conversations/'
alias cdcui='cd ~/projects/wsp-rnwy-conversations/src/main/resources/wsp_rnwy_conversations/js/conversational-ui/'
alias mci='mvn clean install -Denforcer.skip=true -Dmaven.test.skip=true'
alias wiremock='java -jar ~/wiremock/wiremock-standalone-2.25.1.jar -port 8081 --preserve-host-header --max-request-journal-entries 250 --enable-browser-proxying --print-all-network-traffic'

# wsp
export WEBSHOP_HOME=~/projects/webshop
alias brwsp='./webshop build run -mo -Denforcer.skip=true'
alias wspapp='cd $WEBSHOP_HOME/application/wsp-app;mvn -DskipTests=true -Dmaven.test.skip=true -Dspring-boot.run.jvmArguments=-agentlib:jdwp=transport=dt_socket,server=y,address=8000,suspend=n -Dspring-boot.run.profiles=wspcypress spring-boot:run'
alias bwendpoints='cd $WEBSHOP_HOME/application/;alias bwapp;mvn -Dmaven.test.skip=true clean install -pl wsp-runway,wsp-endpoints'
alias bwrunway='cd $WEBSHOP_HOME/application/;alias bwrunway;mvn -Dmaven.test.skip=true clean install -pl wsp-runway'
alias bwapp='cd $WEBSHOP_HOME/application/;rm -rf ~/.m2/repository/com/bol/bol/development;mvn -N install;rm -rf ~/.m2/repository/com/bol/wsp-*;alias bwapp;mvn -Dmaven.test.skip=true clean install -pl wsp-atg-bridge,wsp-common,wsp-components,wsp-assets,wsp-adapters,wsp-intra,wsp-runway,wsp-endpoints,wsp-app'
alias wiremock='sed -i -e "s/#  url: http:\/\/localhost:8081/  url: http:\/\/localhost:8081/g" ~/$WEBSHOP_HOME/application/wsp-app/src/main/resources/application-remote.yml;cd ~/Documents/Projects/;java -jar wiremock-standalone.jar -port 8081 --preserve-host-header --max-request-journal-entries 250 --enable-browser-proxying --print-all-network-traffic'

#git bol specific, not in git tool
alias gpushg='git push origin HEAD:refs/for/develop' #push gerrit.

# Go Back Up
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ..6="cd ../../../../../.."


# include git tool
source ~/projects/personal/bash-git-tools/.bp_git_tool

#git branch name
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="$RED\u $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\$(parse_git_branch) → $RESETCOLOR"
}

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export RNWY=~/projects/webshop/application/wsp-components

prompt
export PATH="/usr/local/opt/maven@3.2/bin:$PATH"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
