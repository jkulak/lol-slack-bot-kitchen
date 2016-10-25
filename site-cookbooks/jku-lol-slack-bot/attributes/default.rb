default['jku-lol-slack-bot']['vhost'] = 'lol-slack-bot'
default['jku-lol-slack-bot']['user'] = 'lol-slack-bot'
default['jku-lol-slack-bot']['group'] = 'lol-slack-bot'
default['jku-lol-slack-bot']['home'] = "/home/#{default['jku-lol-slack-bot']['user']}"

# Nginx
default['nginx']['default_site_enabled'] = false
# default['nginx']['install_method'] = 'source'
# default['nginx']['default']['modules'] = ['headers_more_module']
