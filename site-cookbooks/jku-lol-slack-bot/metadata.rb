name             'jku-lol-slack-bot'
maintainer       'Jakub Kułak'
maintainer_email 'jakub.kulak@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures jku-lol-slack-bot'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'jku-cookbook-wrappers', '~> 0.1.3'
depends 'jku-common', '~> 0.1.1'
depends 'mongodb3', '~> 5.3.0'
