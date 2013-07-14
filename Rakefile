#!/usr/bin/env rake

task :default => ['foodcritic', 'knife', 'kitchen']

desc "Runs foodcritic linter"
task :foodcritic do
  Rake::Task[:prepare_sandbox].execute

  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sh "bundle exec foodcritic -f any #{sandbox_path}"
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
  
  Rake::Task[:remove_sandbox].execute
end

desc "Runs knife cookbook test"
task :knife do
  Rake::Task[:prepare_sandbox].execute

  sh "bundle exec knife cookbook test cookbook -c test/.chef/knife.rb -o #{sandbox_path}/../"
  
  Rake::Task[:remove_sandbox].execute
end

desc "Runs kitchen test"
task :kitchen do
  sh "bundle exec kitchen test"
end

task :prepare_sandbox do
  files = %w{*.md *.rb attributes definitions files libraries providers recipes resources templates}

  rm_rf sandbox_path
  mkdir_p sandbox_path
  cp_r Dir.glob("{#{files.join(',')}}"), sandbox_path
end

task :remove_sandbox do
  rm_rf File.join(File.dirname(__FILE__), 'tmp')
end

private
def sandbox_path
  File.join(File.dirname(__FILE__), %w(tmp cookbooks cookbook))
end