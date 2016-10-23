#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'gcc'
include_recipe 'openssl-devel'
include_recipe 'readline-devel'
include_recipe 'bzip2'

bash 'install ruby with rbenv' do
  code 'rbenv install 2.3.1'
  not_if 'rbenv versions | grep 2.3.1'
end

bash 'set global ruby version to 2.3.1' do
  code 'rbenv global 2.3.1'
end
