# -*- encoding: utf-8 -*-
# stub: stal 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "stal"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Michel Martens"]
  s.date = "2015-02-09"
  s.description = "Stal receives s-expressions and resolves the set operations in Redis"
  s.email = ["michel@soveran.com"]
  s.homepage = "https://github.com/soveran/stal"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.6"
  s.summary = "Set algebra solver for Redis"

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<redic>, [">= 0"])
      s.add_development_dependency(%q<cutest>, [">= 0"])
    else
      s.add_dependency(%q<redic>, [">= 0"])
      s.add_dependency(%q<cutest>, [">= 0"])
    end
  else
    s.add_dependency(%q<redic>, [">= 0"])
    s.add_dependency(%q<cutest>, [">= 0"])
  end
end
