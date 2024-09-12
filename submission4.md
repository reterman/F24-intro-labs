# Submission4.md

## Task 1

creating a folder and changing working working directory

```bash
mkdir ~/local-apt-repo
cd ~/local-apt-repo
```

Then you have to copy there your package

```bash
cp /path/to/your/package ~/local-apt-repo
```

Then we need to generate package Index via `dpkg-scanpackages`  

```bash
dpkg-scanpackages ~/local-apt-repo /dev/null | gzip -9c > ~/local-apt-repo/Packages.gz
```

You can verify command worked correctely by the command `zcat Packages.gs`

Next step is add the Local Repository to Your Sources List:

```bash
echo "deb [trusted=yes] file:/home/kali/local-apt-repo ./" | sudo tee /etc/apt/sources.list.d/local-apt-repo.list
sudo apt update # Replace kali to name of your system
```

This command you may check with `apt policy your-package-name`

Proof of my work:

```bash
> ls
nmap.deb  Packages  Packages.gz
```

```bash
> zcat Packages.gz
Package: nmap
Version: 7.94+git20230807.3be01efb1+dfsg-4
Architecture: amd64
Maintainer: Debian Security Tools <team+pkg-security@tracker.debian.org>
Installed-Size: 4498
Depends: nmap-common (= 7.94+git20230807.3be01efb1+dfsg-4), libc6 (>= 2.38), libgcc-s1 (>= 3.0), liblinear4 (>= 2.01+dfsg), liblua5.4-0 (>= 5.4.6), libpcap0.8t64 (>= 1.5.1), libpcre2-8-0 (>= 10.32), libssh2-1t64 (>= 1.2.9), libssl3t64 (>= 3.0.0), libstdc++6 (>= 11), zlib1g (>= 1:1.1.4)
Suggests: ncat, ndiff, zenmap
Filename: /home/kali/local-apt-repo/nmap.deb
Size: 1923072
MD5sum: f2da39b310eadfe876527a09356623fc
SHA1: 45748cdcb8c3349e550591ba56446365602a970f
SHA256: f04800d3b0e27de76dc683d5bc1ff0043a4f20a21f0d60801f87d31c8e42ed9b
Section: net
Priority: optional
Homepage: https://nmap.org/
Description: The Network Mapper
 Nmap is a utility for network exploration or security auditing. It
 supports ping scanning (determine which hosts are up), many port
 scanning techniques, version detection (determine service protocols
 and application versions listening behind ports), and TCP/IP
 fingerprinting (remote host OS or device identification). Nmap also
 offers flexible target and port specification, decoy/stealth scanning,
 sunRPC scanning, and more. Most Unix and Windows platforms are
 supported in both GUI and commandline modes. Several popular handheld
 devices are also supported, including the Sharp Zaurus and the iPAQ.
```

## Task 2

```bash
>apt-cache showpkg tor
Package: tor
Versions:
0.4.8.12-1.1 (/var/lib/apt/lists/http.kali.org_kali_dists_kali-rolling_main_binary-amd64_Packages) (/var/lib/dpkg/status)
 Description Language:
                 File: /var/lib/apt/lists/http.kali.org_kali_dists_kali-rolling_main_binary-amd64_Packages
                  MD5:
 Description Language:
                 File: /var/lib/apt/lists/http.kali.org_kali_dists_kali-rolling_main_binary-i386_Packages
                  MD5:

Reverse Depends:
  tor-geoipdb,tor 0.2.4.8
  winetricks,tor
  torbrowser-launcher,tor
  tor:i386,tor
  tractor,tor
  torsocks,tor
  tor-geoipdb,tor 0.2.4.8
  tor-geoipdb,tor 0.4.8.12-1.1
  onionbalance,tor 0.2.7.1
  selektor,tor
  redsocks,tor
  python3-txtorcon,tor
  python3-torrequest,tor
  popularity-contest,tor
  parcimonie,tor
  onionshare-cli,tor
  onionprobe,tor
  apt-transport-tor,tor
  nyx,tor
  git-annex,tor
  dirmngr,tor
Dependencies:
0.4.8.12-1.1 - libc6 (2 2.38) libcap2 (2 1:2.10) libevent-2.1-7t64 (2 2.1.8-stable) liblzma5 (2 5.1.1alpha+20120614) libseccomp2 (2 0.0.0~20120605) libssl3t64 (2 3.0.0) libsystemd0 (0 (null)) libzstd1 (2 1.5.5) zlib1g (2 1:1.1.4) adduser (0 (null)) runit-helper (2 2.14.0~) lsb-base (0 (null)) libssl0.9.8 (3 0.9.8g-9) runit (3 2.1.2-51~) logrotate (0 (null)) tor-geoipdb (0 (null)) torsocks (0 (null)) mixmaster (0 (null)) torbrowser-launcher (0 (null)) socat (0 (null)) apparmor-utils (0 (null)) nyx (0 (null)) obfs4proxy (0 (null)) runit:i386 (3 2.1.2-51~) tor:i386 (32 (null))
Provides:
0.4.8.12-1.1 -
Reverse Provides:
```

```bash
> sudo apt-get install -s tor
[sudo] password for kali:
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libavfilter9 libdaxctl1 libgeos3.12.1t64 libjsoncpp25 libjxl0.7 libndctl6 libplacebo338 libpmem1 libpostproc57
  librav1e0 libre2-10 libroc0.3 libsvtav1enc1d1 libu2f-udev libx265-199 openjdk-21-jre openjdk-21-jre-headless
  python3-diskcache python3-mistune0 python3-pendulum python3-pytzdata rwho rwhod samba-ad-provision
  samba-dsdb-modules
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  tor-geoipdb
Suggested packages:
  mixmaster torbrowser-launcher apparmor-utils nyx obfs4proxy
The following NEW packages will be installed:
  tor tor-geoipdb
0 upgraded, 2 newly installed, 0 to remove and 118 not upgraded.
Inst tor (0.4.8.12-1.1 kali-rolling [amd64])
Inst tor-geoipdb (0.4.8.12-1.1 kali-rolling [all])
Conf tor (0.4.8.12-1.1 kali-rolling [amd64])
Conf tor-geoipdb (0.4.8.12-1.1 kali-rolling [all])
```

As we can see, the Tor package depends on many packages. However, most of these are already preinstalled on my system. Therefore, Tor will only install one additional packages: `tor-goipdb`.

## Task 3

First step is package installation with `sudo apt install tor` and agree to install dependencies 

**hold** the package:

```bash
> sudo apt-mark hold tor
tor set on hold.
```

**show** holded packages:

```bash
> apt-mark showhold
tor
```

**unhold** package

```bash
> sudo apt-mark unhold tor
Canceled hold on tor.
```

![image.png](image.png)