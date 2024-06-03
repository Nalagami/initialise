#!/bin/bash

# This script is used to initialise the environment for the project

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


#----------------#
# python setup
#----------------#

# Install Python
brew install python

#----------------#
# git setup
#----------------#

# git install
brew install git

# user and email setup
git config --global user.name 'nalagami'
git config --global user.email 'tnt5547@gmail.com'

# push setup
git config --global push.default current

# pull setup
git config --global pull.ff only
git config --global pull.rebase false

# default branch setup
git config --global init.defaultBranch main

# new line setup
git config --global core.autocrlf false

# case sensitive setup
git config --global core.ignorecase false

# color setup
git config --global color.ui true

# default editor setup
git config --global core.editor 'code --wait'

# alias setup
git config --global alias.st status
git config --global alias.df diff
git config --global alias.co commit
git config --global alias.br branch
git config --global alias.ps push
git config --global alias.pl pull
git config --global alias.ck checkout

# no encoard japanese file name
git config --global core.quotepath false

# set vacuum alias
# https://qiita.com/hajimeni/items/73d2155fc59e152630c4
git config --global alias.vacuum "!f () { git checkout $1; git branch --merged|egrep -v '\\*|develop|main'|xargs git branch -d; git fetch --prune; };f"

#----------------#
# aws cli setup
#----------------#

# aws cli install
brew install awscli

#----------------#
# terraform setup
#----------------#

# terraform install
brew install terraform

