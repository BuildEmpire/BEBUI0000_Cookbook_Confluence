#
# Cookbook Name:: cookbook_confluence
# Recipe:: confluence
#

# Setup the confluence installation variables
template "#{Chef::Config[:file_cache_path]}/atlassian-confluence-response.varfile" do
  source 'response.varfile.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Copy the confluence file from the remote location to the local location.
remote_file "#{Chef::Config[:file_cache_path]}/atlassian-confluence-#{node['cookbook_confluence']['version']}-#{node['cookbook_confluence']['arch']}.bin" do
  source node['cookbook_confluence']['url']
  mode '0755'
  action :create_if_missing
end

# Install confluence after the download, using the variables we've setup.
execute "Installing Confluence #{node['cookbook_confluence']['version']}" do
  cwd Chef::Config[:file_cache_path]
  command "./atlassian-confluence-#{node['cookbook_confluence']['version']}-#{node['cookbook_confluence']['arch']}.bin -q -varfile atlassian-confluence-response.varfile"
  creates node['cookbook_confluence']['install_path']
end

# Setup the Java Keystore
execute 'Generating Self-Signed Java Keystore' do
  command <<-COMMAND
#{node['java']['java_home']}/bin/keytool -genkey \
      -alias #{node['cookbook_confluence']['tomcat']['keyAlias']} \
      -keyalg RSA \
      -dname 'CN=#{node['fqdn']}, OU=Example, O=Example, L=Example, ST=Example, C=US' \
      -keypass #{node['cookbook_confluence']['tomcat']['keystorePass']} \
      -storepass #{node['cookbook_confluence']['tomcat']['keystorePass']} \
      -keystore #{node['cookbook_confluence']['tomcat']['keystoreFile']}
    chown #{node['cookbook_confluence']['user']}:#{node['cookbook_confluence']['user']} #{node['cookbook_confluence']['tomcat']['keystoreFile']}
  COMMAND
  creates node['cookbook_confluence']['tomcat']['keystoreFile']
  only_if { node['cookbook_confluence']['tomcat']['keystoreFile'] == "#{node['cookbook_confluence']['home_path']}/.keystore" }
end

# Install the MySQL connector
include_recipe 'mysql_connector'
mysql_connector_j "#{node['cookbook_confluence']['install_path']}/lib"

# Setup the confluence service script
template '/etc/init.d/confluence' do
  source 'confluence.init.erb'
  mode '0755'
  notifies :restart, 'service[confluence]', :delayed
end

# Install and restart the service
service 'confluence' do
  supports :status => true, :restart => true
  action :enable
  subscribes :restart, 'java_ark[jdk]'
end