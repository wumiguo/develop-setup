# Add GitHub Host to speed up network

check hosts file
---
sudo vim /etc/hosts
```text
#add entry to speed up github clone
140.82.113.4 github.com
199.232.69.194  github.global.ssl.fastly.net
```

update DNS Cache
---
sudo killall -HUP mDNSResponder
