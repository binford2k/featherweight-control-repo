class profile::webserver (
  $docroot = '/opt/html/'
) {
  class { 'profile::webserver::apache':
    docroot => $docroot,
  }

  class { 'profile::webserver::content':
    docroot => $docroot,
  }

  firewall { '100 allow http and https access':
    dport  => [80, 443],
    proto  => tcp,
    action => accept,
  }
}
