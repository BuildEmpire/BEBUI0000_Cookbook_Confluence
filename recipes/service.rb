#
# Cookbook Name:: cookbook_confluence
# Recipe:: service
#

# Retrieve the useful variables for the recipe
data_directory = node['cookbook_confluence']['confluence']['data_dir']
teamcity_version = node['cookbook_confluence']['confluence']['version']
memory_options = node['cookbook_confluence']['confluence']['memory_options']

# Set the useful variables for the recipe
server_directory = "/opt/teamcity/#{teamcity_version}/TeamCity"


# Create TeamCity Service
template '/etc/init/teamcity-server.conf' do
  source 'teamcity-server.conf.erb'
  variables(
    :server_path => server_directory,
    :data_path => data_directory,
    :memory_options => memory_options
  )
  notifies :start, 'service[teamcity-server]', :immediately
end

# Start TeamCity Service
service "teamcity-server" do
  provider Chef::Provider::Service::Upstart
  action :restart
end