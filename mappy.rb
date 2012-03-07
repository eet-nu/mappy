begin
  require 'bundler/setup'
rescue LoadError
  require 'rubygems'
  require 'bundler/setup'
end

Bundler.require :default
