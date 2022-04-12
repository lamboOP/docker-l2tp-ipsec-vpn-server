###CHECK LOG
Command
```
sudo PLUTODEBUG="all proposal-parser" /usr/lib/NetworkManager/nm-l2tp-service --debug

```
Solution
```

```
###Fix error: a bytes-like object is required, not str
Information
```
ERROR: for 14a1d8da311a_strongswan-vpn-server_strongswan_1  a bytes-like object is required, not 'str'
```
Solution
```
Modify
#Before
    ports:
      - 500:500/udp
      - 4500:4500/udp
#After
    ports:
      - "500:500/udp"
      - "4500:4500/udp"
```
```
Change docker-compose version
#Before
version: '2'
#After
version: '3.3' or any version
```
###Fix error: bind port in-used
Information
```
ERROR: for 14a1d8da311a_strongswan-vpn-server_strongswan_1  Cannot start service strongswan: driver failed programming external connectivity on endpoint strongswan-vpn-server_strongswan_1 (eaba21eeb7a55eaab717856c8c43c8175d2ed42115766cdca8ee4d107442552c): Error starting userland proxy: listen udp4 0.0.0.0:500: bind: address already in use
```
Solution
```
- Install net-tool
apt install net-tools
- Check who use the port
sudo netstat -pna | grep <port number>
sudo lsof -i -P -n | grep <port number>
Eg:
sudo lsof -i -P -n | grep 500
sudo netstat -pna | grep 500
The information will like this
charon      527            root   14u  IPv6  24309      0t0  UDP *:500 
charon      527            root   15u  IPv6  24310      0t0  UDP *:4500 
charon      527            root   16u  IPv4  24311      0t0  UDP *:500 
charon      527            root   17u  IPv4  24312      0t0  UDP *:4500
---
Then, kill the process
kill -9 <process-id>
Eg:
kill -9 527
```
