$:.unshift(File.dirname(__FILE__))

require 'config/environment'

ENV['RACK_ENV'] ||= 'development'
set :environment, ENV['RACK_ENV'].to_sym

map "/api/sparrow/v1" do
  run SparrowV1
end
