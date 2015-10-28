environment = (ENV['RACK_ENV'] ||= 'development').to_sym

require 'rubygems'
require 'bundler'
Bundler.require(:default, environment)

ROOT = File.dirname(File.absolute_path(__FILE__)) + '/../'

require "#{ROOT}/api/v1.rb"
Dir.glob("#{ROOT}/{lib,api}/**/*.rb", &method(:require))
