# WH-PI

## Setup

### Setup Raspberry Pi OS

Download & install Raspberry Pi OS Lite

Login with: pi/raspberry

Set up Wi-Fi & locale settings with  `sudo raspi-config`

### Setup user accounts

Set root password with `sudo passwd`

Login as root

Remove default pi user with `deluser --remove-home pi`

### SSH as root

/etc/ssh/sshd_config: PermitRootLogin Yes

`systemctl reload ssh`

Get Raspberry Pi's IP address with `ip addr`

Set up ~/.ssh/config entry on workstation:

```
HostName wh-pi
    HostName: $ip_addr
    User root
```

Run `ssh-copy-id` from workstation

Test SSH connection with `ssh wh-pi`

/etc/ssh/sshd_config: #PermitRootLogin: prohibit-password

`systemctl reload ssh`

Disconnect monitor + keyboard from Raspberry Pi

### System packages

```
apt update
apt upgrade
apt install git git-crypt
```

### Install Docker & Docker Compose

`curl -sSL https://get.docker.com | sh`

(-s = --silent, -S = --show-error, -L = --location; follow http 3xx status codes)

`apt install python3-pip`

`pip3 install docker-compose`

### Download & setup script

Prerequisites: Valid GPG key to unlock git-crypt

```bash
cd # to /root
git clone https://github.com/WaveHack/intranet
cd intranet
git-crypt unlock
```

Update .env file

### Watch the magic happen

`docker-compose up --build -d`

## Usage
