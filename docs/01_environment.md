# 環境構築手順

## 概要
VirtualBoxとVagrantを使ってUbuntu22.04のVM環境を構築する

## 使用ソフトウェア
|
  ソフトウェア
|
  バージョン
|
|
---
|
---
|
|
  VirtualBox
|
  7.2.8
|
|
  Vagrant
|
  2.4.9
|
|
  Ubuntu
|
  22.04 LTS
|

## 手順

### 1.VirtualBoxインストール
  https://www.virtualbox.org/wiki/DownLoads
  から`Windows Hosts` をダウンロードしてインストール。

### 2.Vagrantインストール
  https://developer.hashicorp.com/vagrant/install
  から`Windows AMD64`をダウンロードしてインストール後、再起動。

### 3.作業フォルダ作成
  ```bash
  mkdir C:\vagrant-lab
  cd C:\vagrant-lab
  ```

### 4.Vagrantfile作成
  ```bash
  vagrant init ubuntu/jammy64
  ```

### 5.Vagrantfile編集
  以下の内容に書き換える

  ```ruby
  Vagrant.configure("2") do |config|
    config.vm.define "web01" do |web|
      web.vm.box = "Ubuntu/jammy64"
      web.vm.hostname = "web01"
      web.vm.network "private_networl", ip: "192.168.56.10"
      web.vm.provider "virtualbox" do |vb|
        vb.name     = "web01"
        vb.memory   = "2048"
        vb.cpus     = 2
      end
    end
    config.vm.define "db01" do |db|
      db.vm.box = "Ubuntu/jammy64"
      db.vm.hostname = "db01"
      db.vm.network "private_network", ip: "192.168.56.20"
      db.vm.provider "virtualbox" do |vb|
        vb.name   = "db01"
        vb.memory = "1024"
        vb.cpus   = 1
      end
    end
  end
  ```

### 6.VM起動
  ```bash
  vagrant up
  ```

### 7.SSH接続
  ```bash
  vagrant ssh web01
  ```

## 確認コマンド
  ```bash
  vagrant status    # VM状態確認
  vagrant halt      # VM停止
  vagrant up        # VM起動
  vagrant destroy   # VM完全削除

## ハマりポイント
  - 初回起動時にSSH接続がタイムアウトする場合は`vagrant halt`後に`vagrant up`で解決
  - Vagrantfileを書き換える際は事前に`vagrant destroy`を実行
  - VirtualBoxのHost-Onlyアダプタが消えた場合はホストネットワークマネージャーから再作成
  