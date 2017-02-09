template "/etc/kibana/kibana.yml" do
    source "kibana.yml.erb"
    owner "root"
    group "root"
    mode 0660
    variables({
    	:configs => node[:kibana5_ninja][:configs]
    })
end
