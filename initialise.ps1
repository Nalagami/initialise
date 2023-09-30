#########################
# python �̐ݒ�
# version 3.11
######################### 
winget install --id Python.Python.3.11 --accept-package-agreements

#########################
# git�̐ݒ�
# �Q�V https://blog.katsubemakito.net/git/git-config-1st 
######################### 

# ���[�U�[���A���[���A�h���X
git config --global user.name 'nalagami'
git config --global user.email 'tnt5547@gmail.com'

# push����
git config --global push.default current

# pull����
git config --global pull.ff only
git config --global pull.rebase false

# �f�t�H���g�u�����`��
git config --global init.defaultBranch main

# ���s�R�[�h�����ϊ��ݒ�
git config --global core.autocrlf false

# �t�@�C���� �啶�����������ʐݒ�
git config --global core.ignorecase false

# �n�C���C�g�ݒ�
git config --global color.ui true

# �f�t�H���g�G�f�B�^
git config --global core.editor 'code --wait'

# �G�C���A�X�ݒ�
git config --global alias.st status
git config --global alias.df diff
git config --global alias.co commit
git config --global alias.br branch
git config --global alias.ps push
git config --global alias.pl pull
git config --global alias.ck checkout

# ���{��t�@�C�������G���R�[�h���Ȃ�
git config --global core.quotepath false

# vacuum�R�}���h��ǉ�
# https://qiita.com/hajimeni/items/73d2155fc59e152630c4
Add-Content -Path $HOME/.gitconfig -Encoding utf8 "[alias]`n`tvacuum = `"!f () { git checkout $1; git branch --merged|egrep -v '\\*|develop|main'|xargs git branch -d; git fetch --prune; };f`""

# git�̏�Ԃ�\������A�v�����C���X�g�[��
# https://github.com/dahlbyk/posh-git/blob/master/README.md
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm
Install-Module posh-git -Scope CurrentUser -AllowPrerelease -Force
Add-PoshGitToProfile -AllHosts

#########################
# node.js�̐ݒ�
######################### 

# nvm �C���X�g�[��
winget install --id CoreyButler.NVMforWindows --accept-package-agreements
# nvm install --lts

# git cz
npm install -g git-cz

#########################
# aws cli �̐ݒ�
######################### 

# aws cli �C���X�g�[��
winget install --id Amazon.AWSCLI --accept-package-agreements

#########################
# ServerlessFramework�̐ݒ�
######################### 

# ServerlessFramework �C���X�g�[��
npm install -g serverless

#########################
# Terraform�̐ݒ�
######################### 

# terraform �C���X�g�[��
winget install --id Hashicorp.Terraform --accept-package-agreements
