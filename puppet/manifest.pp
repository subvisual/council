$data = hiera('gb-council')

gb::ruby { 'ruby-2.2.0': }

gb::postgresql { 'gb-council':
  password => $data[db_password]
}

gb::capistrano { 'gb-council': }
gb::nginx_conf { 'gb-council':
  path => 'config/nginx.conf',
}
