class profile::webserver::apache ($docroot) {
  class { 'apache':
    docroot => $docroot,
  }
}
