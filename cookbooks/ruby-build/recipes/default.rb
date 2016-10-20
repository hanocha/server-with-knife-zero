#
# Cookbook Name:: ruby-build
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'
include_recipe 'rbenv'

directory '/usr/local/rbenv/plugins' do
  mode '0755'
  action :create
end

git '/usr/local/rbenv/plugins/ruby-build' do
  repository 'git://github.com/rbenv/ruby-build.git'
  revision 'master'
end
