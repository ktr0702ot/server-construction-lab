# Linux基礎設定手順

## 概要
  ユーザー作成・SSH鍵認証・ファイアーウォール設定を行う。

## 手順

## 1.パッケージ更新
  ```bash
  sudo apt update && sudo apt upgrade -y

## 2.ユーザー作成
  ```bash
  sudo adduser kotaro
  sudo usermod -aG sudo kotaro

## 3.SSH鍵ペア作成（windows側）
  ```powershell
  ssh-keygen -t ed25519 -C "kotaro@web01"
  ```

### 4.SSH設定ディレクトリ作成
  ```bash
  su - kotaro
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
  touch ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/authorized_keys
  ```

### 5.公開鍵登録
  ```bash
  echo "公開鍵の文字列" >> ~/.ssh/atuthorized_keys
  ```

### 6.sshd_config編集
  ```bash
  sudo nano /etc/ssh/sshd_config.d/60-clouding-settings.conf
  ```
  以下を設定：
  ```
  PasswordAuthentication no
  ```

  ```
  bash
  ```
  sudo nano /etc/ssh/sshd_config
  ```
  以下を設定：
  ```
  PasswordAuthentication no
  PermitRootLogin no
  ```
  
  ```
  bash
  ```
  sudo systemctl restart ssh
  ```

### 7.ファイアーウォール設定
  ```bash
  sudo ufw allow 22
  sudo ufw enable
  sudo ufw status
  ```

### 確認コマンド
  ```bash
  ssh -i ~/.ssh/id_ed25519 -o 2222 kotaro@127.0.0.1
  ```

## ハマりポイント
  - `/etc/ssh/sshd_config.d/60-clouding-settings.conf`が`sshd_config`より優先される
  - 設定変更後は必ず`sudo systemctl restart ssh`を実行
  - パーミッションが正しくないとSSH接続が拒否される（.ssh:700、authorized_keys:600）