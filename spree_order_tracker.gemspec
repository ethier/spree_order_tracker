# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_order_tracker'
  s.version     = '1.1.3'
  s.summary     = 'Track your Spree Order'
  s.description = 'Tracking orders in a Spree Extension'
  s.required_ruby_version = '>= 1.9.2'

  s.author    = ['Jeff Dutil', 'Vladimir Fedorov']
  s.email     = ['jdutil@burlingtonwebapps.com', 'vlad@railsdog.com']
  s.homepage  = 'http://www.spreecommerce.com/extensions'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.3.0.rc2'

  s.add_development_dependency 'capybara', '~> 1.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 3.6'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'simplecov'
end
