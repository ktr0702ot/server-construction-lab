# Webサーバー構築手順（Apache）

## 概要
  ApacheをインストールしてNginxと共存させる
  Nginxが80番を使用しているため、Apacheは8080番で起動

## 手順

### 1.Apacheインストール
  ```bash
  sudo apt install apache2 -y
  ```

### 2.ポートを8080に変更
  ```bash
  sudo nano /etc/apache2/ports.conf
  ```
  以下を変更：
  Listen 8080

### 3.virtualホスト設定
  ```bash
  sudo nano /etc/apache2/sites-available/000-default.conf
  ```
  以下を変更：
  <VirtualHost *:8080>

### 4.Apache起動・ファイアーウォール設定
  ```bash
  sudo systemctl restart apache2
  sudo ufw allow 8080
  ```

## 確認方法
  ブラウザで以下にアクセス：
  http://192.168.56.10:8080

## NginxとApacheの比較
  | 項目 | Nginx | Apache |
  |---|---|
  | 処理方式 | 非同期・イベント駆動型 | 1リクエスト1プロセス |
  | 大量アクセス | 得意 | 苦手 |
  | 設定ファイル | シンプル | 高機能 |
  | 実務での主流 | 今の主流 | 今も使われる |

## ハマりポイント
  - NginxとApacheは同じ80番ポートを使うため同時起動する場合はポートを変更する
  - ports.confとsites-available両方のポート番号を変更する必要がある
