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
