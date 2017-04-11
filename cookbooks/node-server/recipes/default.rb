#
# Cookbook:: node-server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'nginx'
include_recipe 'nodejs'
# include_recipe "nodejs::npm"
# include_recipe 'pm2::default'
# include_recipe "nodejs::nodejs_from_package"
include_recipe 'git'


service 'nginx' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template '/etc/nginx/sites-available/default' do
  source 'nginx.default.erb'
  notifies :reload, "service[nginx]"
end

nodejs_npm 'pm2'
