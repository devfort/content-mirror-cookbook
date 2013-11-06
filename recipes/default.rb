mirror "cpan" do
  target node.cpan_mirror.data_dir
  user node.cpan_mirror.user
  hostname node.cpan_mirror.apache.listen_hostname
  port node.cpan_mirror.apache.listen_port
  command "rsync -aP --delete #{node.cpan_mirror.remote} #{node.cpan_mirror.data_dir}"
  cookbook "mirror-core"
end
