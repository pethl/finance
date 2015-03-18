# Load the rails application
require File.expand_path('../application', __FILE__)
require 'quandl'


# Initialize the rails application
Finance::Application.initialize!

Date::DATE_FORMATS.merge!(:default => "%d/%m/%Y")

Quandl.configure do |config|
  config.auth_token = 'ag6eCfR6_FK1EfEfxgZX'
end