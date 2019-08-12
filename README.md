# Sandback Server

## LAN内→LAN外への通信テスト用途のDNS+Webサーバ

---

## 機能

* あらゆる名前解決を自身のWebサーバへのIPに返すDNS
* あらゆる通信をステータス200で返すWebサーバ

## Build

Docker build ./ -t sandback

## Usage

```
docker run --rm -p 53:5300/udp -p 53:5300/tcp -p 80:80 -e HOSTIP={ホストIP} --name sandback sandback
```
