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
include_recipe 'mongodb3::default'

# Process manager for Node.js
nodejs_npm "pm2"
# The streaming build system
nodejs_npm "gulp-cli"

# Create main vhost directory
directory "#{node['jku-lol-slack-bot']['home']}/www" do
    action :create
    not_if { ::File.exists?("#{node['jku-lol-slack-bot']['home']}/www") }
end

# Create versioned directory structure
versioned_dir_structure node['jku-lol-slack-bot']['vhost'] do
    docroot_dir "#{node['jku-lol-slack-bot']['home']}/www"
    user node['jku-lol-slack-bot']['user']
    group node['jku-lol-slack-bot']['user']
end
