apt_package 'apt-transport-https' do
        action :install
end

apt_repository 'kibana5' do
  uri        'https://artifacts.elastic.co/packages/5.x/apt'
  keyserver  'https://pgp.mit.edu/'
  key        'D88E42B4'
  components ['main', 'stable']
  action :add
end
