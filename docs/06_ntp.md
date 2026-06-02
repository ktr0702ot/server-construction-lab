# NTPサーバー構築手順（Chrony）

## 概要
  Chronyをインストールして時刻同期サーバーを構築する
  同一ネットワーク内の他のサーバーがこのサーバーを参照できるようにする

## 手順

### 1.Chronyインストール
  ```bash
  sudo apt install chrony -y

### 2.起動確認
  ```bash
  sudo systemctl status chrony
  ```

### 3.設定ファイル編集
  ```bash
  sudo nano /etc/chrony/chrony.conf
  ```
  以下を追記：
  allow 192.168.56.0/24

### 4.再起動
  ```bash
  sudo systemctl restart chrony
  ```

### 5. ファイアーウォール設定
  ```bash
  sudo ufw allow 123/udp
  ```

## 確認方法
  ```bash
  chronyc sources
  ```
  `*`がついているサーバーが現在同期中のサーバー

## Stratumの階層
  stratum1(原子時計・GPS)
  stratum2(ntp.ubuntu.comなど)←同期先
  stratum3(このweb01サーバー)←ほかのVMが参照できる

## 主要ファイル
  | ファイル | 用途 |
  |---|---|
  | `/etc/chrony/chrony.conf` | メイン設定ファイル |

## ハマりポイント
  - `chrony` コマンドではなく `chronyc` コマンドを使う
  - `allow` 設定がないとほかのサーバーから参照できない

