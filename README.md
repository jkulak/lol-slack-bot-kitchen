# kitchen-lol-slack-bot

Vagrantfile + Chef provisioning scripts for jku-lol-slack-bot

## Usage

To run and use the environment:

```shell
git clone https://github.com/jkulak/lol-slack-bot-kitchen
cd /lol-slack-bot-kitchen
cp environments/local.json.example environments/local.json
# optionally edit environments/local.json
vagrant up
```

And your system is up and running and available at: 192.168.3.26

## Nginx

Version: nginx/1.4.6 (Ubuntu)

Files locations

* service: `/etc/init.d/nginx`
* configuration directory: `/etc/nginx/`
* access log: `/var/log/nginx/acces.log`
* error log: `/var/log/nginx/error.log`

Usage `sudo service nginx start|stop|status`

## MongoDB3

Version: 3.2.8

Files location
* service: `/etc/init/mongod.conf`
* configuration: `/etc/mongod.conf`
* log: `/var/log/mongodb/mongodb.log`

Usage `sudo service mongod start|stop|status`

Connect to server using mongo client
* `$ mongo`

## PM2

* Start process management: `$ pm2 start process.json`
* View monitoring: `$ pm2 monit`
* Stop process: `$ pm2 stop PROCES_ID`
* List running processes: `$ pm2 list`
* View logs: `$ pm2 logs PROCES_ID`
* View process details: `$ pm2 desc PROCES_ID`
