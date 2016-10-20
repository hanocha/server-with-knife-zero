#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2016, hanocha
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

git '/usr/local/rbenv' do
  repository 'git://github.com/sstephenson/rbenv.git'
  revision 'master'
end

directory '/usr/local/rbenv/shims' do
  mode '0755'
  action :create
end

directory '/usr/local/rbenv/versions' do
  mode '0755'
  action :create
end

script 'init rbenv' do
  interpreter 'bash'
  code '/usr/local/rbenv/bin/rbenv init'
  returns 1
end

template '/etc/profile.d/rbenv.sh' do
  source 'rbenv.sh'
  mode '644'
end
