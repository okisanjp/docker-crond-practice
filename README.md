### build
```
$ docker build -t cron-test .
```

### run container
```
$ docker run -it -d cron-test
```

### コンテナの起動を確認

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
0901729117fd        cron-test           "/bin/sh -c 'crond &&"   2 minutes ago       Up 2 minutes                            nostalgic_jepsen
```

### コンテナへ入って確認
```
$ docker exec -it nostalgic_jepsen /bin/bash

# ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.1  11644  2604 ?        Ss+  15:40   0:00 /bin/sh -c crond && tail -f /var/log/crond.log
root         6  0.0  0.1  22756  2656 ?        Ss   15:40   0:00 crond
root         7  0.0  0.0   4360   704 ?        S+   15:40   0:00 tail -f /var/log/crond.log
root         8  0.6  0.1  11760  2872 ?        Ss   15:44   0:00 /bin/bash
root        20  0.0  0.1  47432  3308 ?        R+   15:44   0:00 ps aux

# tail -f /tmp/test.txt
Mon Dec 12 15:54:01 JST 2016 : hello docker
Mon Dec 12 15:55:01 JST 2016 : hello docker
```
