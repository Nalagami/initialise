# -*- coding: utf-8 -*-

function Install-Python {
    Write-Output "Installing pyenv..."
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
Write-Output "Installing the latest Python version using pyenv..."
$latestPythonVersion = pyenv install --list | Select-String -Pattern "^\s*3\.\d+\.\d+$"| ForEach-Object { $_.Line.Trim() } | Where-Object { $_ -notmatch "-" -and $_ -notmatch "b" } | ForEach-Object { [Version]$_ } | Sort-Object -Descending | Select-Object -First 1

pyenv install $latestPythonVersion.ToString()
pyenv global $latestPythonVersion.ToString()
}


function Set-GitConfiguration {
Write-Output "Configuring Git..."
git config --global user.name 'nalagami'
git config --global user.email 'tnt5547@gmail.com'
git config --global push.default current
git config --global pull.ff only
git config --global pull.rebase false
git config --global init.defaultBranch main
git config --global core.autocrlf false
git config --global core.ignorecase false
git config --global color.ui true
git config --global core.editor 'code --wait'
git config --global alias.st status
git config --global alias.df diff
git config --global alias.co commit
git config --global alias.br branch
git config --global alias.ps push
git config --global alias.pl pull
git config --global alias.ck checkout
git config --global core.quotepath false
Add-Content -Path $HOME/.gitconfig -Encoding utf8 "[alias]`n`tvacuum = `"!f () { git checkout $1; git branch --merged|egrep -v '\\*|develop|main'|xargs git branch -d; git fetch --prune; };f`""
}

function Install-oh-my-posh {
Write-Output "Installing oh-my-posh..."
winget install --id JanDeDobbeleer.OhMyPosh --accept-package-agreements
Install-Module posh-git -Scope CurrentUser -Force
Import-Module posh-git
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -PredictionSource History
Install-Module -Name Terminal-Icons
Import-Module -Name Terminal-Icons
}

function Install-NodeJS {
Write-Output "Installing Node.js..."
winget install --id CoreyButler.NVMforWindows --accept-package-agreements
nvm install lts
nvm use lts
}

function Install-AWSCLI {
Write-Output "Installing AWS CLI..."
winget install --id Amazon.AWSCLI --accept-package-agreements
}

function Install-AWSSAMCLI {
Write-Output "Installing AWS SAM CLI..."
winget install --id Amazon.SAMCLI --accept-package-agreements
}

function Install-Terraform {
Write-Output "Installing Terraform..."
winget install --id Hashicorp.Terraform --accept-package-agreements
}

# Main script execution
Write-Output "Initializing the development environment..."
Install-Pyenv
Install-Python
Set-GitConfiguration
Install-oh-my-posh
Install-NodeJS
Install-AWSCLI
Install-AWSSAMCLI
Install-Terraform

Write-Output "Initialization complete."