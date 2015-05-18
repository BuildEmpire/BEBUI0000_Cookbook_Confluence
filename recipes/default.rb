#
# Cookbook Name:: cookbook_confluence
# Recipe:: default
#

include_recipe 'appbox'
include_recipe 'java::default'
include_recipe 'cookbook_confluence::confluence'
include_recipe 'cookbook_confluence::tomcat'
include_recipe 'cookbook_confluence::configuration'