# Linuxサーバー構築ハンズオン

## 概要
VagrantとVirtualBoxを使ってLinuxサーバーを構築するリポジトリです

## 環境
- OS: Ubuntu 22.04 LTS
- 仮想化: VirtualBox 7.2.8
- 構成管理: Vagrant 2.4.9

## サーバー構成
| サーバー名 | IPアドレス | 役割 |
|---|---|---|
| web01 | 192.168.56.10 | Webサーバー |

## 構築内容
- [x] VirtualBox・Vagrant環境構築
- [x] Linux基礎設定（ユーザー作成・SSH鍵認証・UFW）
- [x] Webサーバー構築（Nginx・Apache）
- [ ] DNSサーバー構築
- [ ] NTPサーバー構築

## 使用技術
- Vagrant
- Ubuntu 22.04
- Nginx
- Apache2
- ufw
