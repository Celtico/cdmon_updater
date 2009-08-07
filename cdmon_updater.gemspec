# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cdmon_updater}
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Leonardo Mateo"]
  s.date = %q{2009-08-05}
  s.default_executable = %q{cdmon_updater}
  s.description = %q{Just another client for CDMon (http://www.cdmon.com) dynamic DNS.}
  s.email = %q{leonardomateo@gmail.com}
  s.executables = ["cdmon_updater"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    "LICENSE",
     "README",
     "bin/cdmon_updater",
     "cdmon_updater.gemspec",
     "config/cdmon.yml",
     "config/schedule.rb",
     "lib/cdmon.rb",
     "lib/config.rb",
     "lib/ip_updater.rb",
     "lib/mailer.rb",
     "spec/mailer_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kandalf/cdmon_updater}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{cdmon_updater}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A client updater for CDMon dynamic DNS.}
  s.test_files = [
    "spec/ip_updater_spec.rb",
     "spec/spec_helper.rb",
     "spec/mailer_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
