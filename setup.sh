#!/bin/sh
function backup(){
ts=`date '+%Y%m%d_%H%M%S%Z'`
mv "$1" "$1.${ts}"
cp "$1.${ts}" "$1"
}
function setupHomebrew(){
cd "$(brew --repo)" && git remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && git remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

if [ -e '~/.zshrc' ] ; then
backup ~/.zshrc
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.zshrc
else 
backup ~/.bash_profile
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bash_profile
fi

cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask && git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

brew update -v
}

function githubHosts(){
backup /etc/hosts 
echo "140.82.113.4 github.com" >> /etc/hosts
echo "199.232.69.194  github.global.ssl.fastly.net" >> /etc/hosts
}
function getJdk11(){
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11
}
function setupSbt(){
backup ~/.sbt/repositories
tee ~/.sbt/repositories << EOF
[repositories]
local
huaweicloud-maven: https://repo.huaweicloud.com/repository/maven/
maven-central: https://repo1.maven.org/maven2/
sbt-plugin-repo: https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
EOF
}

githubHosts
setupHomebrew
setupSbt
