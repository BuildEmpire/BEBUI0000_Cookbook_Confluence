#
# Cookbook Name:: cookbook_confluence
# Recipe:: users
#

# Create the confluence user
user_account node['cookbook_confluence']['user'] do
  comment 'Confluence User'
end

# And the confluence group
group node['cookbook_confluence']['user'] do
  action :modify
  members [node['cookbook_confluence']['user']]
end