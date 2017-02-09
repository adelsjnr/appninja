service 'kibana' do
  supports :restart => true
  action [:enable, :start]
end
