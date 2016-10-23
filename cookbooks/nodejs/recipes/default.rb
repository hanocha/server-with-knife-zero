#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'epel'

packages = %w(nodejs npm)

packages.each do |p|
  package p do
    options '--enablerepo=epel'
  end
end
