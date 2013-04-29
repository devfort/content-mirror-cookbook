include_recipe "perl"
include_recipe "apache2"
# cpan_module "CPAN::Mini"

directory node.cpan_mirror.data_dir do
  owner node.cpan_mirror.user
  group node.cpan_mirror.user
  mode "0755"
end

template "/etc/init/cpan-mirror.conf" do
  source "services/cpan-mirror.conf.erb" 
  owner node.cpan_mirror.user
  group node.cpan_mirror.user
  mode "0644"
end

service "cpan-mirror" do
  provider Chef::Provider::Service::Upstart
  action :start
end

web_app "cpan_mirror" do
  docroot node.cpan_mirror.data_dir
  hostname node['cpan_mirror']['apache']['listen_hostname']
  port node['cpan_mirror']['apache']['listen_port']
end

log "Started mirroring CPAN; tail /var/log/upstart/cpan-mirror.log to monitor."
