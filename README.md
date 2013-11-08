Description
===========

This cookbook configures the machine to mirror various sources of static content: documentation, websites, RFCs, and other such relatively simple things.

Requirements
============

Platform
--------

* Ubuntu 13.04 (that's all we support at /dev/fort for now, so that's all I've tested.)

Attributes
==========

Cookbook attributes are named under the `content_mirror` namespace.

* `node['content_mirror']['user']` - user to host mirrors as, defaults to `fort`
* `node['content_mirror']['data_dir']` - directory to store the mirrors in, defaults to '/data'
* `node['content_mirror']['apache']['hostname_template']` - Template for hostnames to listen on for Apache virtualhosts for each mirror, defaults to '%{name}.fort'
* `node['content_mirror']['apache']['listen_port']` - Port to listen on for content Apache virtualhost, defaults to '80'
* `node['content_mirror']['commands']` - Hash of commands to use when mirroring, and templates for their execution. Defaults are `rsync` and `wget`
* `node['content_mirror']['content']` - Hash of sources to mirror. Keyed on mirror name (used in default hostname), each with a hash containing `method` (one of the aforementioned `commands`), `remote`, and optionally `args`. Other values may be added for new command templates.


Recipes
=======

The main entrypoint for this cookbook is the `default` recipe.

Usage
=====

Include `content-mirror` and it will start replicating the content specified by the attributes in `node.content_mirror.content` using the methods specified. This will take a _very_ long time (probably the best part of a day), and require tens of gigabytes of storage. You have been warned.

You can keep an eye on the mirroring progress by running `tail -f /var/log/upstart/content-mirror.log`.
