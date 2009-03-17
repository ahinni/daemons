require "rake"
require "rake/clean"
require "rake/gempackagetask"
require 'rake/rdoctask'
require 'rubygems'

################################################################################
### Gem
################################################################################

begin
  # Parse gemspec using the github safety level.
  file = Dir['*.gemspec'].first
  data = File.read(file)
  spec = nil
  Thread.new { spec = eval("$SAFE = 3\n%s" % data)}.join

  # Create the gem tasks
  Rake::GemPackageTask.new(spec) do |package|
    package.gem_spec = spec
  end
rescue Exception => e
  printf "WARNING: Error caught (%s): %s\n%s", e.class.name, e.message, e.backtrace[0...5].map {|l| '  %s' % l}.join("\n")
end

desc "Create the RDOC html files"
rd = Rake::RDocTask.new("rdoc") { |rdoc|
  rdoc.rdoc_dir = 'html'
  rdoc.title    = "Daemons"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README'
  rdoc.rdoc_files.include('README', 'TODO', 'Releases')
  rdoc.rdoc_files.include('lib/**/*.rb')
}

desc 'Package and install the gem for the current version'
task :install => :gem do
  system "sudo gem install -l pkg/%s-%s.gem" % [spec.name, spec.version]
end