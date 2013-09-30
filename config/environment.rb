# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load config.yml
APP_CONFIG = YAML.load_file("config/config.yml")

# Initialize the Rails application.
SlMobileMech::Application.initialize!
