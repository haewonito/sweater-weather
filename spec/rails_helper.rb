require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

VCR.configure do |config|
    config.allow_http_connections_when_no_cassette = true
    config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
    config.hook_into :webmock
    config.configure_rspec_metadata!  #it will name the cassette automatically under the folder of spec test name, with folder named with the test name.
end

def current_weather_data_for_test
  {:dt=>1642521033,
     :sunrise=>1642515466,
     :sunset=>1642550558,
     :temp=>40.3,
     :feels_like=>40.3,
     :pressure=>1009,
     :humidity=>44,
     :dew_point=>21.47,
     :uvi=>0.42,
     :clouds=>100,
     :visibility=>10000,
     :wind_speed=>1.01,
     :wind_deg=>250,
     :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}]}
end

def daily_weather_data_for_test
  {:dt=>1642532400,
     :sunrise=>1642515466,
     :sunset=>1642550558,
     :moonrise=>1642553160,
     :moonset=>1642518480,
     :moon_phase=>0.52,
     :temp=>{:day=>44.1, :min=>36.34, :max=>49.96, :night=>36.34, :eve=>42.66, :morn=>39},
     :feels_like=>{:day=>42.84, :night=>30.56, :eve=>38.95, :morn=>35.87},
     :pressure=>1008,
     :humidity=>36,
     :dew_point=>20.34,
     :wind_speed=>7.27,
     :wind_deg=>45,
     :wind_gust=>15.59,
     :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
     :clouds=>100,
     :pop=>0.23,
     :uvi=>1.83}
end

def hourly_weather_data_for_test
  {:dt=>1642518000,
     :temp=>39.99,
     :feels_like=>37.29,
     :pressure=>1009,
     :humidity=>45,
     :dew_point=>21.7,
     :uvi=>0.13,
     :clouds=>100,
     :visibility=>10000,
     :wind_speed=>4.03,
     :wind_deg=>226,
     :wind_gust=>3.67,
     :weather=>[{:id=>804, :main=>"Clouds", :description=>"overcast clouds", :icon=>"04d"}],
     :pop=>0}
end

def image_data_for_test
  {
      "total": 5902,
      "total_pages": 5902,
      "results": [
          {
              "id": "2jKehisV_3k",
              "created_at": "2021-03-22T18:42:16-04:00",
              "updated_at": "2022-01-19T14:19:04-05:00",
              "promoted_at": nil,
              "width": 4611,
              "height": 6916,
              "color": "#d9d9c0",
              "blur_hash": "LaI#=MRit6xu10%MR+NGIUE1s:s:",
              "description": "instagram - @jakobnoahrosen",
              "alt_description": "white car near brown wall",
              "urls": {
                  "raw": "https://images.unsplash.com/photo-1616452862870-b43181d0be29?ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA&ixlib=rb-1.2.1",
                  "full": "https://images.unsplash.com/photo-1616452862870-b43181d0be29?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA&ixlib=rb-1.2.1&q=85",
                  "regular": "https://images.unsplash.com/photo-1616452862870-b43181d0be29?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA&ixlib=rb-1.2.1&q=80&w=1080",
                  "small": "https://images.unsplash.com/photo-1616452862870-b43181d0be29?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA&ixlib=rb-1.2.1&q=80&w=400",
                  "thumb": "https://images.unsplash.com/photo-1616452862870-b43181d0be29?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA&ixlib=rb-1.2.1&q=80&w=200"
              },
              "links": {
                  "self": "https://api.unsplash.com/photos/2jKehisV_3k",
                  "html": "https://unsplash.com/photos/2jKehisV_3k",
                  "download": "https://unsplash.com/photos/2jKehisV_3k/download?ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA",
                  "download_location": "https://api.unsplash.com/photos/2jKehisV_3k/download?ixid=MnwyOTI3OTl8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMjBjb3xlbnwwfHx8fDE2NDI2MjY5NzA"
              },
              "categories": [],
              "likes": 3,
              "liked_by_user": false,
              "current_user_collections": [],
              "sponsorship": nil,
              "topic_submissions": {},
              "user": {
                  "id": "qOQ1e9l0U_s",
                  "updated_at": "2022-01-19T15:44:09-05:00",
                  "username": "jakobnoahrosen",
                  "name": "Jakob Rosen",
                  "first_name": "Jakob",
                  "last_name": "Rosen",
                  "twitter_username": nil,
                  "portfolio_url": "https://www.instagram.com/jakobnoahrosen/",
                  "bio": nil,
                  "location": "Denver, Co",
                  "links": {
                      "self": "https://api.unsplash.com/users/jakobnoahrosen",
                      "html": "https://unsplash.com/@jakobnoahrosen",
                      "photos": "https://api.unsplash.com/users/jakobnoahrosen/photos",
                      "likes": "https://api.unsplash.com/users/jakobnoahrosen/likes",
                      "portfolio": "https://api.unsplash.com/users/jakobnoahrosen/portfolio",
                      "following": "https://api.unsplash.com/users/jakobnoahrosen/following",
                      "followers": "https://api.unsplash.com/users/jakobnoahrosen/followers"
                  },
                  "profile_image": {
                      "small": "https://images.unsplash.com/profile-1616187995138-11252f2dd5b2image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                      "medium": "https://images.unsplash.com/profile-1616187995138-11252f2dd5b2image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                      "large": "https://images.unsplash.com/profile-1616187995138-11252f2dd5b2image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                  },
                  "instagram_username": "jakobnoahrosen",
                  "total_collections": 8,
                  "total_likes": 108,
                  "total_photos": 2433,
                  "accepted_tos": true,
                  "for_hire": true,
                  "social": {
                      "instagram_username": "jakobnoahrosen",
                      "portfolio_url": "https://www.instagram.com/jakobnoahrosen/",
                      "twitter_username": nil,
                      "paypal_email": nil
                  }
              },
              "tags": [
                  {
                      "type": "search",
                      "title": "denver"
                  },
                  {
                      "type": "search",
                      "title": "co"
                  },
                  {
                      "type": "search",
                      "title": "usa"
                  }
              ]
          }
      ]
  }
end
