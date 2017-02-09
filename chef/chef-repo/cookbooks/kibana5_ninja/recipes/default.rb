#
# Cookbook Name:: kibana5_ninja
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "kibana5_ninja::add_repo"
include_recipe "kibana5_ninja::install"
include_recipe "kibana5_ninja::config"
include_recipe "kibana5_ninja::enable"
