# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  # FactoryBotの記述省略
  config.include FactoryBot::Syntax::Methods

  # deviseで使うヘルパー
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :system

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

# SNSログイン機能うまくテストできないので一旦停止
# def twitter_mock
#   OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
#     "provider" => "twitter",
#     "uid" => "123456",
#     "info" => {
#       "name" => "Mock User",
#       "image" => "http://mock_image_url.com",
#       "location" => "",
#       "email" => "mock@example.com",
#       "urls" => {
#         "Twitter" => "https://twitter.com/MockUser1234",
#         "Website" => ""
#       }
#     },
#     "credentials" => {
#       "token" => "mock_credentails_token",
#       "secret" => "mock_credentails_secret"
#     },
#     "extra" => {
#       "raw_info" => {
#         "name" => "Mock User",
#         "id" => "123456",
#         "followers_count" => 0,
#         "friends_count" => 0,
#         "statuses_count" => 0
#       }
#     }
#   )
# end

# # omniauthのテストモードに変更
# OmniAuth.config.test_mode = true
