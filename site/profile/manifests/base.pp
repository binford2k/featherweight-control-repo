class profile::base {
  #the base profile should include component modules that will be on all nodes
  # logging, hardening, compliance, admin accounts, whatever goes on all your machines
  include firewall

  package { 'tree':
    ensure => present,
  }
}
