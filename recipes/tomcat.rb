#
# Cookbook Name:: cookbook_confluence
# Recipe:: tomcat
#

template "#{node['cookbook_confluence']['install_path']}/bin/setenv.sh" do
  source 'setenv.sh.erb'
  owner node['cookbook_confluence']['user']
  mode '0755'
  notifies :restart, 'service[confluence]', :delayed
end

template "#{node['cookbook_confluence']['install_path']}/conf/server.xml" do
  source 'server.xml.erb'
  owner node['cookbook_confluence']['user']
  mode '0640'
  notifies :restart, 'service[confluence]', :delayed
end

template "#{node['cookbook_confluence']['install_path']}/conf/web.xml" do
  source 'web.xml.erb'
  owner node['cookbook_confluence']['user']
  mode '0644'
  notifies :restart, 'service[confluence]', :delayed
end