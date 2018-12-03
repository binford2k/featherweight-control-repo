class profile::webserver::content ($docroot) {
  # this resource ensures that all parent directories also exist, like mkdir -p
  dirtree { $docroot:
    path    => $docroot,
    parents => true,
  }
  file { $docroot:
    ensure  => directory,
    source  => 'puppet:///modules/profile/webserver/docroot',
    recurse => true,
  }
}

