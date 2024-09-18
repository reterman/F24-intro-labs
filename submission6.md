
# Task 1: Operating System Analysis

## System Boot Time

### `systemd-analyze`
```
Startup finished in 3.559s (kernel) + 37.557s (userspace) = 41.116s
graphical.target reached after 37.501s in userspace
```

### `systemd-analyze blame`
```
34.575s plymouth-quit-wait.service
29.073s vboxadd.service
 1.793s snapd.seeded.service
 1.532s snapd.service
 1.027s logrotate.service
 1.002s networkd-dispatcher.service
  903ms dev-sda3.device
  806ms dev-loop12.device
  806ms dev-loop14.device
  778ms dev-loop8.device
  776ms dev-loop15.device
  775ms dev-loop16.device
  773ms dev-loop21.device
  756ms dev-loop13.device
  748ms dev-loop18.device
  735ms dev-loop9.device
  719ms dev-loop10.device
  719ms dev-loop11.device
  709ms udisks2.service
  707ms dev-loop19.device
  682ms dev-loop17.device
  677ms dev-loop20.device
  669ms user@1000.service
  664ms NetworkManager-wait-online.service
  636ms accounts-daemon.service
  623ms dev-loop0.device
  601ms dev-loop3.device
  595ms dev-loop2.device
  594ms dev-loop7.device
```

## System Load and Uptime

### `uptime`
```
17:52:14 up 1 min, 1 user, load average: 1.28, 0.58, 0.21
```

### `w`
```
17:52:14 up 1 min, 1 user, load average: 1.28, 0.58, 0.21
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
reterman tty2     tty2             17:51    1:44   0.04s  0.04s /usr/libexec/gn
```

## Observations

- System boot time: 41.116 seconds, where the kernel boot time is 3.559 seconds and the userspace boot time is 37.557 seconds.
- The slowest services are: `plymouth-quit-wait.service` (34.575s) and `vboxadd.service` (29.073s), suggesting that VirtualBox-related services are resource-heavy during startup.
- The average system load for the last 1, 5, and 15 minutes is 1.28, 0.58, and 0.21 respectively. This indicates that the system is under normal load, as the load average does not exceed 1 per CPU core.



## Task 2: Networking Analysis

### Traceroute
```
traceroute to vk.com (93.186.225.194), 30 hops max, 60 byte packets
 1  _gateway (10.0.2.2)  17.970 ms  17.586 ms  18.238 ms
```

### DNS Lookup (Dig)
```
; <<>> DiG 9.18.28-0ubuntu0.22.04.1-Ubuntu <<>> vk.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 19636
;; flags: qr rd ra; QUERY: 1, ANSWER: 6, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;vk.com.				IN	A

;; ANSWER SECTION:
vk.com.			750	IN	A	87.240.129.133
vk.com.			750	IN	A	87.240.137.164
vk.com.			750	IN	A	87.240.132.78
vk.com.			750	IN	A	93.186.225.194
vk.com.			750	IN	A	87.240.132.67
vk.com.			750	IN	A	87.240.132.72

;; Query time: 0 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Wed Sep 18 18:02:34 MSK 2024
;; MSG SIZE  rcvd: 131
```

### Observations:
- **Traceroute:** No information was obtained for the route to vk.com as all intermediate hops did not respond. This could be due to router configurations that block ICMP requests.
- **DNS Lookup:** Multiple IP addresses were returned for vk.com, indicating the presence of several servers for load balancing and availability. The DNS query response time was minimal (0 ms).

