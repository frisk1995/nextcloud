# dockerインストール
* 前提パッケージのインストール
```
yum install -y yum-utils device-mapper-persistent-data lvm2
yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-1.el7_6.noarch.rpm
```

* リポジトリ追加
```
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

* docker-ceインストール
```
yum -y install docker-ce
```

* バージョン確認
```
docker --version
```

# docker-composeインストール
```
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

# docker-compose実行権付与
```
chmod +x /usr/local/bin/docker-compose
```

# 作業ディレクトリ作成
```
mkdir /home/docker/nextcloud; cd $_
```

# ファイル配置
```
vim Dockerfile
vim docker-compose.yml
```

# 起動
```
docker build -t nextcloud .
```

```
docker-compose up -d
```

# 動作確認
ブラウザからhttp:///nextcloud/にアクセス  
Installer画面で以下の項目を入力し、「Continue」をクリックする  
データベースのユーザ名: root  
データベースのパスワード: nextcloud  
データベース名: nextcloud  
データベースのホスト名: db:3306  
他の項目は好みに合わせて入力  
