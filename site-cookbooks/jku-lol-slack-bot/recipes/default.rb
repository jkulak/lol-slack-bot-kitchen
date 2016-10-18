#
# Cookbook Name:: jku-lol-slack-bot
# Recipe:: node
#
# Copyright 2016, Jakub Kułak
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'jku-common::default'
include_recipe 'jku-cookbook-wrappers::nodejs'
include_recipe 'jku-cookbook-wrappers::nodejs_development'
include_recipe 'mongodb3::default'

user node['jku-lol-slack-bot']['user'] do
  comment "#{node['jku-lol-slack-bot']['user']} user"
  home "/home/#{node['jku-lol-slack-bot']['user']}"
  shell '/bin/bash'
end

group node['jku-lol-slack-bot']['group'] do
  action :modify
  members [node['jku-lol-slack-bot']['user']]
  append true
end

# Create main vhost directory
directory "/var/www" do
    action :create
    user node['apache']['user']
    group node['apache']['group']
    not_if { ::File.exists?("/var/www") }
end

# Create versioned directory structure
versioned_dir_structure node['jku-lol-slack-bot']['vhost'] do
    docroot_dir node['apache']['docroot_dir']
    user node['apache']['user']
    group node['apache']['group']
end

# Create Apache2 vhost
web_app node['jku-lol-slack-bot']['vhost'] do
    server_name node['jku-lol-slack-bot']['vhost']
    docroot "#{node['apache']['docroot_dir']}/#{node['jku-lol-slack-bot']['vhost']}/www"
    cookbook 'apache2'
    user node['apache']['user']
    group node['apache']['group']
    directory_options '+Indexes'
end
