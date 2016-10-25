# Recipe deploying code when run locally in Vagrant VM

# Delete the initial directory (if empty) from the default structure to link mounted directory
directory "#{node['jku-lol-slack-bot']['home']}/www/#{node['jku-lol-slack-bot']['user']}/releases/initial" do
  action :delete
  only_if { ::Dir.entries("#{node['jku-lol-slack-bot']['home']}/www/#{node['jku-lol-slack-bot']['user']}/releases/initial").join == "..." }
end

link "#{node['jku-lol-slack-bot']['home']}/www/#{node['jku-lol-slack-bot']['user']}/releases/initial" do
    to "/mnt/host/mount_dir"
    user node['jku-lol-slack-bot']['user']
    group node['jku-lol-slack-bot']['group']
end
