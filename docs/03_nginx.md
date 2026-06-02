## Webサーバー構築手順

## 概要
  NginxをインストールしてWebサーバーを構築する

## 手順

### 1.Nginxインストール
  ```bash
  sudo apt install niginx -y
  ```

### 2.起動確認
  ```bash
  sudo systemctl status nginx
  ```

### 3.ファイアーウォール設定
  ```bash
  sudo ufw allow 80
  sudo ufw status 
  ```

### 4.オリジナルページ作成
  ```bash
  sudo nano /var/www/html/index.html
  ```
  以下を入力：
  ```html
  <!DOCTYPE html>
  <html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>web01</title>
  </head>
  <body>
    <h1>Hello from web01!</h1>
    <p>構築者：kotaro</p>
  </body>
  </html>
  ```

## 確認方法
  ブラウザで以下にアクセス
  http://192.168.56.10

## 主要ファイル
  | ファイル | 用途 |
  | --- | --- |
  | `/etc/nginx/nginx.conf` | メイン設定ファイル |
  | `/etc/nginx/sites-available/default` | デフォルトサイト設定 |
  | `/var/www/html/` | ドキュメントルート |

## 主要コマンド
  ```bash
  sudo systemctl start nginx    # 起動
  sudo systemctl stop nginx     # 停止
  sudo systemctl restart nginx  # 再起動
  sudo systemctl status nginx   # 状態確認

## ハマりポイント
  - NginxとApacheは同じ80番ポートを使うため同時起動不可
  - inde.htmlはindex.nginx-debian.htmlより優先して表示される
  
  