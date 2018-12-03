class role::webserver {
  # This role would be made of all the profiles that need to be included to make a webserver work
  # Note that this doesn't describe any of the implementation details, just what this node *is*

  # All roles should include the base profile
  include profile::base
  include profile::webserver
}
