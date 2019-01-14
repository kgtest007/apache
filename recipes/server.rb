#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
end

directory "/var/www/mysite" do
  owner 'root'
  recursive true
  mode '0755'
end


service 'httpd' do
  action [ :enable, :start ]
  retries 3
  retry_delay 5
end
