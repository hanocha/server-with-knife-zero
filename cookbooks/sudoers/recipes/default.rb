#
# Cookbook Name:: sudoers
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/sudoers' do
  source 'sudoers'
  mode '440'
end
