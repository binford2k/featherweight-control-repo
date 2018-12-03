class profile::webserver::nginx ($docroot) {
  include nginx

  nginx::resource::server{'test.local':
    www_root             => $docroot,
    use_default_location => false,
  }

  # nginx is weird and gets mad if you don't have a host record. Don't do this
  # in a real environment.
  host { 'test.local':
    ip => '127.0.0.1',
  }
}
