# Recipe deploying code when run locally in Vagrant VM

# Delete the initial directory (if empty) from the default structure to link mounted directory
directory "#{node['apache']['docroot_dir']}/#{node['jku-lol-slack-bot']['vhost']}/releases/initial" do
  action :delete
  only_if { ::Dir.entries("#{node['apache']['docroot_dir']}/#{node['jku-lol-slack-bot']['vhost']}/releases/initial").join == "..." }
end

link "#{node['apache']['docroot_dir']}/#{node['jku-lol-slack-bot']['vhost']}/releases/initial" do
    to "/mnt/host/mount_dir"
    user node['jku-lol-slack-bot']['user']
    group node['jku-lol-slack-bot']['group']
end
