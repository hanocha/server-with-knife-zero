#
# Cookbook Name:: user
# Recipe:: add
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# include_recipe 'group'

data_ids = data_bag('users')

groups = {}

data_ids.each do |id|
  u = data_bag_item('users', id)
  user u['uid'] do
    gid u['gid'] unless u['uid'] == u['gid']
    password u['password']
    home u['home']
    shell u['shell']
    password u['password'] if u['password']
    manage_home true
  end

  (u['groups'] || []).each do |name|
    groups[name] ||= []
    groups[name] << u['uid']
  end

  directory u['home'] do
    mode 0755
  end

  next unless u['authorized_keys']

  directory "#{u['home']}/.ssh" do
    owner u['uid']
    group u['gid']
    mode 0755
  end

  file "#{u['home']}/.ssh/authorized_keys" do
    content u['authorized_keys'].join("\n")
    owner u['uid']
    group u['gid']
    mode 0600
  end
end

groups.each do |name, members|
  group name do
    members members
    action :manage
  end
end
