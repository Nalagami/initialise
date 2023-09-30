#########################
# python の設定
# version 3.11
######################### 
winget install --id Python.Python.3.11 --accept-package-agreements

#########################
# gitの設定
# 参老 https://blog.katsubemakito.net/git/git-config-1st 
######################### 

# ユーザー名、メールアドレス
git config --global user.name 'nalagami'
git config --global user.email 'tnt5547@gmail.com'

# push方式
git config --global push.default current

# pull方式
git config --global pull.ff only
git config --global pull.rebase false

# デフォルトブランチ名
git config --global init.defaultBranch main

# 改行コード自動変換設定
git config --global core.autocrlf false

# ファイル名 大文字小文字識別設定
git config --global core.ignorecase false

# ハイライト設定
git config --global color.ui true

# デフォルトエディタ
git config --global core.editor 'code --wait'

# エイリアス設定
git config --global alias.st status
git config --global alias.df diff
git config --global alias.co commit
git config --global alias.br branch
git config --global alias.ps push
git config --global alias.pl pull
git config --global alias.ck checkout

# 日本語ファイル名をエンコードしない
git config --global core.quotepath false

# vacuumコマンドを追加
# https://qiita.com/hajimeni/items/73d2155fc59e152630c4
Add-Content -Path $HOME/.gitconfig -Encoding utf8 "[alias]`n`tvacuum = `"!f () { git checkout $1; git branch --merged|egrep -v '\\*|develop|main'|xargs git branch -d; git fetch --prune; };f`""

# gitの状態を表示するアプリをインストール
# https://github.com/dahlbyk/posh-git/blob/master/README.md
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
Add-PoshGitToProfile -AllHosts

#########################
# node.jsの設定
######################### 

# nvm インストール
winget install --id CoreyButler.NVMforWindows --accept-package-agreements
# nvm install --lts

# git cz
npm install -g git-cz

#########################
# aws cli の設定
######################### 

# aws cli インストール
winget install --id Amazon.AWSCLI --accept-package-agreements

#########################
# ServerlessFrameworkの設定
######################### 

# ServerlessFramework インストール
npm install -g serverless

#########################
# Terraformの設定
######################### 

# terraform インストール
winget install --id Hashicorp.Terraform --accept-package-agreements
