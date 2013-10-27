include_recipe "apache2"

directory node['cpan_mirror']['data_dir'] do
  owner node['cpan_mirror']['user']
  group node['cpan_mirror']['user']
  mode "0755"
  recursive true
end

%w{
  cpan-mirror
  cpan-mirror-shim
}.each{ |svc|
  template "/etc/init/#{svc}.conf" do
    source "services/#{svc}.conf.erb"
    owner node['cpan_mirror']['user']
    group node['cpan_mirror']['user']
    mode "0644"
  end
}

service "cpan-mirror-shim" do
  provider Chef::Provider::Service::Upstart
  action :restart
end

web_app "cpan_mirror" do
  docroot node['cpan_mirror']['data_dir']
  hostname node['cpan_mirror']['apache']['listen_hostname']
  port node['cpan_mirror']['apache']['listen_port']
end

log "Started mirroring CPAN; tail /var/log/upstart/cpan-mirror.log to monitor."
