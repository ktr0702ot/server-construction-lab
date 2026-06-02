# 複数台構成手順

## 概要
  VagrantfileでVM2台を定義してネットワーク設計を行う。

## サーバー構成
  - web01: 192.168.56.10 (webサーバー)
  - db01: 192.168.56.20(DBサーバー)

## 手順

### 1.Vagrantfileを編集して2台構成にする
  ```ruby
  Vagrant.configure("2") do |config|

    config.vm.define "web01" do |web|
      web.vm.box = "ubuntu/jammy64"
      web.vm.hostname = "web01"
      web.vm.network "private_network", ip: "192.168.56.10"
      web.vm.provider "virtualbox" do |vb|
        vb.name   = "web01"
        vb.memory = "2048"
        vb.cpus   = 2
      end
    end

    config.vm.define "db01" do |db|
      db.vm.box = "ubuntu/jammy64"
      db.vm.hostname = "db01"
      db.vm.network "private_network", ip: "192.168.56.20"
      db.vm.provider "virtualbox" do |vb|
        vb.name   = "db01"
        db.memory = "1024"
        db.cpus   = 1
      end
    end
  end

### 2.db01起動
  ```bash
  vagrant up db01
  ```

### 3.状態確認
  ```bash
  vagrant status
  ```

### 4.web01にSSH接続
  ```bash
  vagrant ssh web01
  ```

### 5.db01へ疎通確認
  web01からdb01にping:
  ```bash
  ping -c 3 192.168.56.20
  ```

## 主要コマンド
  ```bash
  vagrant ssh web01   # web01に接続
  vagrant ssh db01    # db01に接続
  vagrant halt web01  # web01のみ
  vagrant up db01     # db01のみ起動
  vagrant destroy     # VM完全削除

## ハマりポイント
  - Vagrantfileを書き換える前はvagrant destroyを実行
  - virtualboxにVMが残っている場合は手動で削除が必要
  - host-onlyアダプタが消えた場合はvirtualboxのホストネットワークマネージャから再作成