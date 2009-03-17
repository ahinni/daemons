Gem::Specification.new do |s|
  # Project
  s.name         = 'daemons'
  s.summary      = "A toolkit to convert your script to a controllable daemon (with Chris Kline's fix)"
  s.description =<<EOF
    This is Daemons 1.0.10 with the addition of Chris Kline's fix from http://blog.rapleaf.com/dev/?p=19

    Daemons provides an easy way to wrap existing ruby scripts (for example a self-written server) to be run as a daemon and to be controlled by simple start/stop/restart commands.

    If you want, you can also use daemons to run blocks of ruby code in a daemon process and to control these processes from the main application.

    Besides this basic functionality, daemons offers many advanced features like exception backtracing and logging (in case your ruby script crashes) and monitoring and automatic restarting of your processes if they crash.

    Daemons includes the daemonize.rb script written by Travis Whitton to do the daemonization process.
EOF
  s.version      = "1.0.10.2"
  s.date         = "2009-03-17"
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Thomas Uehlinger","Travis Whitton","Chris Kline","Filip H.F. 'FiXato' Slagter"]
  s.email        = "filip@yomedia.com"
  s.homepage     = "http://github.com/FiXato/daemons"

  # Files
  root_files     = %w[LICENSE README.rdoc Rakefile Releases TODO daemons.gemspec]
  lib_files      = %w[daemons]
  daemon_libs    = %w[application application_group  cmdline  controller  daemonize exceptions monitor pid pidfile pidmem]
  s.require_path = "lib"
  s.files        = root_files + lib_files.map {|f| 'lib/%s.rb' % f} + daemon_libs.map {|f| 'lib/daemons/%s.rb' % f}

  # rdoc
  s.has_rdoc         = true
  s.extra_rdoc_files = %w[README.rdoc Releases]
  s.rdoc_options << '--inline-source' << '--line-numbers' << '--main' << 'README.rdoc'

  # Dependencies
  # s.add_dependency 'daemons', ">= 1.0.10.1"

  # Requirements
  s.required_ruby_version = ">= 1.8.0"
end