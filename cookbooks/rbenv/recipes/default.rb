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

script 'init and install rbenv' do
  interpreter 'bash'
  code <<-EOS
echo 'export PATH="/usr/local/rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh
/usr/local/rbenv/bin/rbenv init
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
EOS
  not_if %Q{ls '/etc/profile.d/rbenv.sh'}
end
