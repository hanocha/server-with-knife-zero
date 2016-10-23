#
# Cookbook Name:: epel
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'add epel' do
  code <<-EOS
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/epel.repo
EOS
  creates "/etc/yum.repos.d/epel.repo"
end
