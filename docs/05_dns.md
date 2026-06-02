# DNSサーバー構築手順（BIND9）

## 概要
BIND9をインストールしてweb01.localの名前解決を設定する

## 手順

### 1.BIND9インストール
  ```bash
  sudo apt install bind9 bind9utils -y
  ```

### 2.ゾーン定義
  ```bash
  sudo nano /etc/bind/named.conf.local
  以下を追記：
    zone "web01.local" {
    type master;
    file "/etc/bind/db.web01.local";
    };

### 3.ゾーンファイル作成
  ```bash
  sudo cp /etc/bind/db.local /etc/bind/db.web01.local
  sudo nano /etc/bind/db.web01.local
  ```
  以下の内容に書き換え：
    $TTL    604800
      @       IN      SOA     web01.local. root.web01.local. (
                        2             ; Serial
                      604800          ; Refresh
                      86400           ; Retry
                      2419200         ; Expire
                      604800 )        ; Negative Cache TTL
      ;
      @       IN      NS      web01.local.
      @       IN      A       192.168.56.10
      web01   IN      A       192.168.56.10

### 4.設定確認・再起動
  ```bash
  sudo named-checkconf
  sudo named-checkzone web01.local /etc/bind/db.web01.local
  sudo systemctl restart bind9
  ```

### 5.ファイアーウォール設定
  ```bash
  sudo ufw allow 53
  ```

## 確認方法
  ```bash
  dig @192.168.56.10 web01.local
  ```
  `status:NoERROR`と`192.168.56.10`が返ってくればOK

## 主要ファイル
  | ファイル | 用途 |
  | --- | --- |
  | `/etc/bind/named.conf.local` | ゾーン定義 |
  | `/etc/bind/db.web01.local` | ゾーンファイル |

## ハマりポイント
  - ゾーンファイルのSerialは変更のたびに番号を上げる
  - ドメイン名の末尾に`.`(ドット)を忘れない
  