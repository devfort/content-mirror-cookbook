Description
===========

This cookbook configures the machine as a mirror of http://cpan.org/.

Requirements
============

Platform
--------

* Ubuntu 13.04 (that's all we support at /dev/fort for now, so that's all I've tested.)

Attributes
==========

Cookbook attributes are named under the `cpan_mirror` namespace.

* `node['cpan_mirror']['user']` - user to host CPAN mirror as, defaults to `fort`
* `node['cpan_mirror']['data_dir']` - directory to store CPAN mirror in, defaults to '/data/cpan'
* `node['cpan_mirror']['remote_cpan']` - URL of CPAN mirror to replicate from, defaults to 'http://www.cpan.org/'
* `node['cpan_mirror']['apache']['listen_hostname']` - Hostname to listen on for CPAN Apache virtualhost, defaults to '*'
* `node['cpan_mirror']['apache']['listen_port']` - Port to listen on for CPAN Apache virtualhost, defaults to '80'

Recipes
=======

The main entrypoint for this cookbook is the `default` recipe.

Usage
=====

Include `cpan-mirror` and it will start replicating http://cpan.org. This will take a _very_ long time (probably the best part of a day), and require tens of gigabytes of storage. You have been warned.

You can keep an eye on the mirroring progress by running `tail`ing `/var/log/upstart/cpan-mirror.log`.
