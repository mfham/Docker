* memo

propcs: top, psコマンド用
htop: 監視用
stress-ng: 負荷をかける用

* command

```
$ docker build -t netdata .
$ docker run -it -p 19999:19999 netdata bash
```

```
# In docker
$ bash <(curl -Ss https://my-netdata.io/kickstart.sh)
```

