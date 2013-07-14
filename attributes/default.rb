default['cpan_mirror']['user'] = 'fort'
default['cpan_mirror']['data_dir'] = '/data/cpan'
default['cpan_mirror']['remote_cpan'] = 'http://www.cpan.org/'
default['cpan_mirror']['apache']['listen_hostname'] = '*'
default['cpan_mirror']['apache']['listen_port'] = '80'

override['apache']['default_site_enabled'] = false