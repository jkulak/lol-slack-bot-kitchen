name             'jku-lol-slack-bot'
maintainer       'Jakub Kułak'
maintainer_email 'jakub.kulak@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures jku-lol-slack-bot'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'mongodb3',     '~> 5.3.0'
depends 'user',         '~> 0.4.2'
depends 'sudo',         '~> 2.7.2'
depends 'magic_shell',  '~> 1.0.0'
depends 'git',          '~> 4.5.0'
depends 'nodejs',       '~> 2.4.4'
