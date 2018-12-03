# A Featherweight Puppet Control Repository

## What You Get From This control-repo

None of that fancy crap like a Puppet Master or anything, this is literally the
barebones to get started with a local `puppet apply` based setup. Once you get
this figured out, then you should look into a Puppet server and see if you'd
benefit from the infrastructure consistency that it can provide.

## Getting Started

1. Boot up a CentOS 7 node.
1. Install the Puppet Yum repository
    * `sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm`
1. Install Puppet
    * `sudo yum install puppet-agent`
    * Add `/opt/puppetlabs/puppet/bin/` to your `$PATH` and relogin.
1. Deploy this codebase
    * `sudo yum install git`
    * `cd /etc/puppetlabs/code/environments/production`
    * `rm -rf *`
    * `git clone https://github.com/binford2k/featherweight-control-repo .`
    
    
## Running Puppet

Before you run Puppet, you'll need all the modules this repo uses installed. We
do that with the `r10k` tool. Let's install that, and then deploy the modules.

1. `gem install r10k`
1. `r10k puppetfile install`

Any time you change the `Puppetfile`, which we'll look at in a bit, you'll need
to deploy again by running the r10k command.

Now you're ready to run Puppet...

* `sudo puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp`

When done, it will have deployed a simple website that you can see by browsing
to http://address_of_machine.


## What now?

Well, that's really it. You've got a machine managed by Puppet, a role class and
a couple of profile classes. Now you can play with it and learn.

1. Look at the folder structure and see how the files are laid out
    * `tree data/ manifests/ site/`
    * `cat Puppetfile`
    * `cat manifests/site.pp`
    * `cat site/role/manifests/webserver.pp`
    * `cat site/profile/manifests/webserver.pp`
    * `cat site/profile/manifests/webserver/apache.pp`
1. Maybe you don't like Apache. Let's switch to nginx.
    * Edit the Puppetfile to include the nginx module
    * `r10k puppetfile install`
    * Edit `site/profile/manifests/webserver.pp` to declare the `nginx` profile instead of `apache`.
    * `systemctl stop httpd`
    * `puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp`
1. But what about that `/opt/html` path? Let's change that
    * `cat data/common.yaml`
    * Add a key like the following:
        * `profile::webserver::docroot: /var/www/html`
    * `sudo puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp`
1. Maybe you don't even like CentOS? Let's switch to Debian.
    * Boot a new Debian machine.
    * `wget https://apt.puppetlabs.com/puppet5-release-wheezy.deb`
    * `sudo dpkg -i puppet5-release-wheezy.deb`
    * `sudo apt-get update`
    * `sudo apt-get install puppet-agent`
    * Go to the *Running Puppet* section

Now go check out the docs and see what else you can do. Feel free to hit my up on
the Puppet Slack if you want more advice.

* https://puppet.com/docs/puppet/latest
* https://forge.puppet.com
* http://slack.puppet.com