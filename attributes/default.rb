default['cookbook_confluence']['confluence']['version'] = '8.1.4'
default['cookbook_confluence']['confluence']['address'] = 'localhost'
default['cookbook_confluence']['confluence']['data_dir'] = '/root/.BuildServer'
default['cookbook_confluence']['confluence']['jdbc']['download_url'] = "http://ftp.kaist.ac.kr/mysql/Downloads/Connector-J/"
default['cookbook_confluence']['confluence']['jdbc']['filename'] = "mysql-connector-java-5.1.32.tar.gz"
default['cookbook_confluence']['confluence']['jdbc']['extract_command'] = "tar --strip-components=1 -zxvf mysql-connector-java-5.1.32.tar.gz mysql-connector-java-5.1.32/mysql-connector-java-5.1.32-bin.jar"
default['cookbook_confluence']['confluence']['memory_options'] = "-Xms750m -Xmx750m -XX:MaxPermSize=270m"