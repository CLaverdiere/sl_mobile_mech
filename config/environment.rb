# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load config.yml
begin
  APP_CONFIG = YAML.load_file("config/config.yml")
rescue
  APP_CONFIG = { :username => 'scott', :password => 'onheroku!<>' }
end

# Initialize the Rails application.
SlMobileMech::Application.initialize!
