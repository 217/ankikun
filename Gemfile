source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

	# jQuery-UIを使う為のgem
	gem "jquery-ui-rails"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# omniauth
gem 'omniauth'
# この二つがないと、うまく機能しない
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# 認証システム
gem 'devise'

# 管理画面
gem 'typus', :git => 'https://github.com/fesplugas/typus.git'

# ブログエディタ
gem 'cleditor-rails'

gem 'ckeditor'
gem 'paperclip'
gem 'execjs'
gem 'therubyracer'

# Rspec
group :development, :test do
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.2"
  gem "launchy", ">= 2.1.0" 
  
  # http://d.hatena.ne.jp/mallowlabs/20110611/jenkinsrubytests
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
end 

# debug
group :development, :test do
  gem 'awesome_print', '~> 1.0.2'
end
