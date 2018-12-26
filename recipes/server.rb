#
# Cookbook:: apache
# Recipe:: server
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content '<h1>Hello, World!</h1><br><h2>This is and auto generated page from the Chef Receipe server.rb</h2>'
end

service 'httpd' do
  action [ :enable, :start ]
  retries 3
  retry_delay 5
end
