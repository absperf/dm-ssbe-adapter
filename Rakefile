require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "dm-ssbe-adapter"
    gem.summary = %Q{A DataMapper adapter for System Shepherd flavored REST services}
    gem.email = "psadauskas@gmail.com"
    gem.homepage = "http://github.com/absperf/dm-ssbe-adapter"
    gem.authors = ["Paul Sadauskas"]

    gem.add_dependency 'dm-core', '~> 0.10.0'
    gem.add_dependency 'resourceful', '~> 0.5'
    gem.add_dependency 'extlib', '~> 0.9.11'
    gem.add_dependency 'json', '~> 1.1.0'

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_opts << '--options spec/spec.opts' if File.exists?('spec/spec.opts')
    t.libs << 'lib'
    t.spec_files = FileList["spec/**/*_spec.rb"]
  end
rescue LoadError
  task :spec do
    abort 'rspec is not available'
  end
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "dm-ssbe-adapter #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

