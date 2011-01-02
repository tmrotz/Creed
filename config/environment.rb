
ENV['Rails.env'] ||= 'production'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Creed::Application.initialize!
