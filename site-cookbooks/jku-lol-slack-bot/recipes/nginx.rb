#
# Cookbook Name:: jku-lol-slack-bot
# Recipe:: nginx
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

include_recipe 'chef_nginx::default'
include_recipe 'nginx_conf::default'

cache_dir = "/data/nginx/cache"

# Create cache directory
directory "#{cache_dir}" do
    recursive true
    # mode 00755
    action :create
    not_if { ::File.directory?("#{cache_dir}") }
end

# To configure caching and headers, wait for the response:
# https://github.com/chef-cookbooks/chef_nginx/issues/31

node.default['nginx']['extra_configs'] = {
    "proxy_cache_path" => "#{cache_dir} levels=1:2 keys_zone=STATIC:10m inactive=24h max_size=1g",
    "server_tokens" => "off"
    # "more_clear_headers" => "Server"
}

nginx_conf_file "lol-slack-bot-local" do

    listen "80"
    locations["/"] = {
        "proxy_pass" => "http://127.0.0.1:8081",
        "proxy_http_version" => "1.1",
        "proxy_set_header" => "Host $host",
        "proxy_cache" => "STATIC",
        "proxy_cache_valid" => "200 1d",
        "proxy_cache_use_stale" => "error timeout invalid_header updating http_500 http_502 http_503 http_504"
    }
end
