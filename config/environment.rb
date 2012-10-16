# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Todozen::Application.initialize!

ENV['MONGO_USERNAME'] = "root"
ENV['MONGO_PASSWORD'] = "root"
ENV['MONGO_HOST'] = "127.0.0.1:27017"
