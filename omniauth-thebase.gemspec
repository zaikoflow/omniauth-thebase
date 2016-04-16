require File.expand_path('../lib/omniauth-thebase/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Masahiro Saito"]
  gem.email         = ["camelmasa@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Thebase}
  gem.summary       = %q{OmniAuth strategy for Thebase.}
  gem.homepage      = "https://github.com/stockflow/omniauth-thebase"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-thebase"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Thebase::VERSION

  gem.add_dependency 'omniauth', '~> 1.2'
  gem.add_dependency 'omniauth-oauth2', '~> 1.4'
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency 'rack-test', "~> 0.6"
  gem.add_development_dependency "webmock", "~> 1.22"
end
