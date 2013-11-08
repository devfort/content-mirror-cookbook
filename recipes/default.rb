node.content_mirror.content.each do |name, config|
  default_config = Mash.from_hash({
    name: name,
    target: "#{node.content_mirror.data_dir}/#{name}",
    args: nil,
  })
  local_config = default_config.merge(config).symbolize_keys
  mirror name do
    target "#{node.content_mirror.data_dir}/#{name}"
    user node.content_mirror.user
    hostname node.content_mirror.apache.hostname_template % local_config
    port node.content_mirror.apache.listen_port
    cwd "#{node.content_mirror.data_dir}/#{name}"
    command node.content_mirror.commands[config['method']] % local_config
    cookbook "mirror-core"
  end
end
