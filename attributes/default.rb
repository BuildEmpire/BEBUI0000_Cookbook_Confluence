default['cookbook_confluence']['appname'] = 'confluence'
default['cookbook_confluence']['hostname'] = 'localhost'
default['cookbook_confluence']['listen_port'] = '80'

default['cookbook_confluence']['home_path']      = '/var/atlassian/application-data/confluence'
default['cookbook_confluence']['install_path']   = '/opt/atlassian/confluence'
default['cookbook_confluence']['install_type']   = 'installer'
default['cookbook_confluence']['url_base']       = 'http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence'
default['cookbook_confluence']['user']           = 'confluence'
default['cookbook_confluence']['version']        = '5.7.4'
default['cookbook_confluence']['update']         = true
default['cookbook_confluence']['arch'] = 'x64'
default['cookbook_confluence']['url']      = "#{node['cookbook_confluence']['url_base']}-#{node['cookbook_confluence']['version']}-#{node['cookbook_confluence']['arch']}.bin"
default['cookbook_confluence']['checksum'] = ''

default['cookbook_confluence']['jvm']['minimum_memory']  = '256m'
default['cookbook_confluence']['jvm']['maximum_memory']  = '512m'
default['cookbook_confluence']['jvm']['maximum_permgen'] = '256m'
default['cookbook_confluence']['jvm']['java_opts']       = ''

default['cookbook_confluence']['tomcat']['keyAlias']     = 'tomcat'
default['cookbook_confluence']['tomcat']['keystoreFile'] = "#{node['cookbook_confluence']['home_path']}/.keystore"
default['cookbook_confluence']['tomcat']['keystorePass'] = 'changeit'
default['cookbook_confluence']['tomcat']['port']         = '8090'
default['cookbook_confluence']['tomcat']['ssl_port']     = '8443'