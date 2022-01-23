xiebiao.github.io
===================

blog.xiebiao.com

## github多账号管理

### 1.生成ssh key
### 2.github上配置公钥
### 3.设置~/.ssh/config

```

Host xiebiao.github.com #github账号域名
  HostName github.com #github必须指定该名称
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_rsa_joyrap@gmail.com  #账号公钥

Host joyrap.github.com #github账号域名
  HostName github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_rsa_xiebiao80@gmail.com

```
### 4.配置仓库地址

`` git remote set-url origin git@** Host **:** 账号名 **/** 仓库名 **.git ``

例如:git@joyrap.github.com:joyrap/blog.xiebiao.com.git
- Host:   joyrap.github.com
- 账号名: joyrap
- 仓库名: blog.xiebiao.com
