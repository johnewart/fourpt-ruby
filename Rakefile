require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "fourpt-ruby"
    s.summary = "Wrapper for the Fortran fourpt model written in Ruby"
    s.email = "john@johnewart.net"
    s.homepage = "http://github.com/johnewart/fourpt-ruby"
    s.description = "Ruby library to wrap the FourPt 1-D flow model written in Fortran"
    s.authors = ["John Ewart"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Ruby FourPt '
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rcov::RcovTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

task :default => :rcov
