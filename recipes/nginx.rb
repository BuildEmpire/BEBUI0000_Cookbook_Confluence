#
# Cookbook Name:: cookbook_confluence
# Recipe:: nginx
#
# Install Nginx from source to support custom Nginx modules in future.
#

# Set the initialisation style for nginx
node.set['nginx']['init_style'] = "init"

# Install nginx from source
include_recipe "nginx::source"

# Setup the template and restart nginx
template(File.join(node['nginx']['dir'], 'sites-available', node['cookbook_confluence']['appname'])) do
  source    'nginx_vhost.conf.erb'
  mode      '0644'
  owner     'root'
  group     'root'
  notifies :reload, 'service[nginx]'
end