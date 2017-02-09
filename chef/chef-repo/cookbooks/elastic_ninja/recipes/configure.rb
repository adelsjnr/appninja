elasticsearch_configure 'ninja_es_config' do
    allocated_memory '512m'
    configuration ({
      'cluster.name' => 'ninja_es_log_cluster',
      'node.name' => 'node01',
      "network.host" => '["_site_","_local_"]',
      'http.port' => 9200
    })
end
