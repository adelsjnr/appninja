#!/bin/bash
cp -r chef/chef-repo chef/elastic.json chef/solo.rb chef/Berksfile /tmp/
cd /tmp
berks install
berks vendor chef-repo/vendor-cookbooks/
mv /tmp/chef-repo/cookbooks /tmp/chef-repo/cookbooks-orig
mv /tmp/chef-repo/vendor-cookbooks /tmp/chef-repo/cookbooks

