apt_package 'apt-transport-https' do
        action :install
end

apt_repository 'kibana5' do
  uri        'https://artifacts.elastic.co/packages/5.x/apt'
  key        'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  distribution ''
  components ['stable','main']
  action :add
end
