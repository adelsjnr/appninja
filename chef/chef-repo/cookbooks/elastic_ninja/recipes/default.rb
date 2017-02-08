#
# Cookbook Name:: elastic_ninja
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java"
include_recipe "elastic_ninja::install"
include_recipe "elastic_ninja::user"
include_recipe "elastic_ninja::configure"
include_recipe "elastic_ninja::service"
