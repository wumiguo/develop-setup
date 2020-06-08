#!/bin/sh

function getJdk11(){
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk11
}
function setupSbt(){
tee ~/.sbt/repositories << EOF
[repositories]
local
huaweicloud-maven: https://repo.huaweicloud.com/repository/maven/
maven-central: https://repo1.maven.org/maven2/
sbt-plugin-repo: https://repo.scala-sbt.org/scalasbt/sbt-plugin-releases, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
EOF
}

getJdk11
setupSbt
