# -*- encoding: utf-8 -*-
# stub: rack-jekyll 0.4.5 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-jekyll"
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bryan Goines", "Ad\u{e3}o Raul"]
  s.date = "2015-11-06"
  s.description = "Rack-Jekyll transforms your Jekyll app into a Rack application."
  s.email = "adao.raul@gmail.com"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "https://github.com/adaoraul/rack-jekyll"
  s.rdoc_options = ["--charset=UTF-8", "--main=README.markdown"]
  s.rubyforge_project = "rack-jekyll"
  s.rubygems_version = "2.4.8"
  s.summary = "Transform your Jekyll app into a Rack application."

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, [">= 1.3"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.5"])
      s.add_runtime_dependency(%q<listen>, [">= 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
    else
      s.add_dependency(%q<jekyll>, [">= 1.3"])
      s.add_dependency(%q<rack>, ["~> 1.5"])
      s.add_dependency(%q<listen>, [">= 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
    end
  else
    s.add_dependency(%q<jekyll>, [">= 1.3"])
    s.add_dependency(%q<rack>, ["~> 1.5"])
    s.add_dependency(%q<listen>, [">= 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
  end
end
