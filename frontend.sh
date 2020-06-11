#!/bin/sh


reset(){
npm config set registry https://registry.npmjs.org
}
changeRegistry(){
npm config set registry https://registry.npm.taobao.org
npm install -g cnpm --registry=https://registry.npm.taobao.org
}
upgradeNode(){
npm install -g n
n stable
}
test(){
npm install -g jquery
npm install hexo-cli -g
}

changeRegistry
upgradeNode
test
