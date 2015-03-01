default['content_mirror']['user'] = 'fort'
default['content_mirror']['data_dir'] = '/data'
default['content_mirror']['apache']['hostname_template'] = '%{name}.fort'
default['content_mirror']['apache']['listen_port'] = '80'

default['content_mirror']['commands'] = {
  rsync: 'rsync -aP --delete %{args} %{remote} %{target}',
  wget: 'wget -m -k -p -nH -np %{args} %{remote}',
}

default['content_mirror']['content'] = {
  'rfcs' => {
    method: 'rsync',
    remote: 'ftp.rfc-editor.org::rfcs-text-only',
  },
  'I-Ds' => {
    method: 'rsync',
    remote: 'ftp.rfc-editor.org::ids-text-only',
  },
  'imdb' => {
    method: 'rsync',
    remote: 'ftp.funet.fi::ftp/pub/mirrors/ftp.imdb.com/pub/',
    args: '--exclude diffs',
  },

  'w3' => {
    method: 'wget',
    args: '-l 2',
    remote: 'http://www.w3.org/TR/',
  },
}
