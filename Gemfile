source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 6.0.3", ">= 6.0.3.4"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "bootsnap", ">= 1.4.2", require: false
gem "rack-cors", require: "rack/cors"
gem "active_model_serializers"
gem "active_model_validates_intersection_of"

group :development, :test do
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "coveralls", require: false
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
