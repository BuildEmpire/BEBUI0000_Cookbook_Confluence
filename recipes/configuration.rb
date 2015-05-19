#
# Cookbook Name:: cookbook_confluence
# Recipe:: configuration
#

template "#{node['cookbook_confluence']['install_path']}/confluence/WEB-INF/classes/confluence-init.properties" do
  source 'confluence-init.properties.erb'
  owner node['cookbook_confluence']['user']
  mode '0644'
  notifies :restart, 'service[confluence]', :delayed
end